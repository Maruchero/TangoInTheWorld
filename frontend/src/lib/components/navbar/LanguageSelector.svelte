<script lang="ts">
	import { isAnyDropdownOpen, language } from '$lib/stores';
	import Dropdown from '../Dropdown.svelte';

	const defaultLanguage = 'English';
	const languages: { [key: string]: string } = {
		English: 'en',
		Español: 'es'
	};

	let dropdownStatus = false;
	let selectedOption: string = defaultLanguage;
	$: language.set(languages[selectedOption]);

	function toggleDropdown() {
		const newStatus = !dropdownStatus;
		isAnyDropdownOpen.set(false);
		isAnyDropdownOpen.set(newStatus);
		dropdownStatus = newStatus;
	}
</script>

<!-- HTML -->
<div class="icon">
	<button class="fa-solid fa-language" on:click={toggleDropdown}></button>
	<div class="dropdown">
		<Dropdown options={Object.keys(languages)} bind:opened={dropdownStatus} bind:selectedOption
		></Dropdown>
	</div>
</div>

<!-- STYLE -->
<style lang="scss">
	.icon {
		position: relative;

		display: flex;
		align-items: center;
	}

	button {
		background: inherit;
		border: none;
		font-size: inherit;
		padding: 0;
	}

	.fa-language {
		color: $background-active;
		font-size: 1.2em;
	}

	.dropdown {
		position: absolute;
		bottom: 0;
		right: 0;
	}
</style>
