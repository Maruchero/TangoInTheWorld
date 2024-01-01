<script lang="ts">
	import LanguageSelector from './LanguageSelector.svelte';
	import PersonalAreaButton from './PersonalAreaButton.svelte';
</script>

<!-- HTML -->
<nav>
	<span class="_dummy"></span>
	<span class="title">TangoInTheWorld</span>
	<div class="buttons">
		<LanguageSelector></LanguageSelector>
		<PersonalAreaButton />
	</div>
</nav>

<!-- STYLE -->
<style lang="scss">
	nav {
		display: grid;
		grid-template-columns: 1fr auto 1fr;
		align-items: center;

		height: 50px;

		background: $background;
		box-shadow: 0px 4px 4px 0px rgba(0, 0, 0, 0.06);

		position: relative;
	}

	.title {
		font-size: 23px;
		font-weight: bold;
		justify-self: center;
	}

	.buttons {
		$gap: 20px;

		justify-self: end;

		display: flex;
		gap: $gap;
		padding-inline: $gap;
		font-size: 18px;
	}
</style>
