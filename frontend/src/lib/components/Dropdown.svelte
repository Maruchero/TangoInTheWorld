<script lang="ts" generics="Option">
	import { isAnyDropdownOpen } from '$lib/stores';

	export let options: Option[];
	export let opened = false;
	export let selectedOption: Option | undefined = undefined;

	let status: 'opened' | 'closed' = 'closed';
	$: status = opened ? 'opened' : 'closed';

	isAnyDropdownOpen.subscribe((isOpen: boolean) => {
		if (!isOpen) {
			opened = false;
		}
	});

	function select(option: Option) {
		selectedOption = option;
		opened = false;
	}
</script>

<!-- HTML -->
<div class="dropdown {status}">
	<div class="styled-dropdown">
		{#each options as option}
			<button
				class="option"
				class:selected={option === selectedOption}
				on:click={() => select(option)}>{option}</button
			>
		{/each}
	</div>
</div>

<!-- STYLE -->
<style lang="scss">
	.dropdown {
		position: absolute;
		right: 0;
		z-index: 100;

		overflow: hidden;
		transition: opacity 200ms;
		transition: translate 200ms;

		font-size: 15px;
	}

	.opened {
		translate: 0;
		opacity: 1;
	}

	.closed {
		translate: 0 -10px;
		opacity: 0;
		pointer-events: none;
	}

	.styled-dropdown {
		box-sizing: border-box;
		border: 1px solid $gray-2;
		border-radius: 5px;
		background: $background;
		overflow: hidden;

		display: flex;
		flex-direction: column;
	}

	button.option {
		background: none;
		border: none;
		font-family: inherit;
		font-size: inherit;
		color: inherit;

		flex: 1 1 auto;
		padding: 5px 15px;
		cursor: default;
	}

	.option.selected {
		background: $background-active;
		color: $foreground-active;
	}

	.option:hover {
		background: $gray-3;
		color: $foreground;
	}
</style>
