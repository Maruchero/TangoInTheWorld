<script lang="ts">
	import Navbar from '$lib/components/navbar/Navbar.svelte';
</script>

<!-- HTML -->
<div class="container">
	<Navbar></Navbar>
	<div class="scroll-y">
		<div class="centered-content">
			<slot />
		</div>
	</div>
</div>

<!-- STYLE -->
<style lang="scss">
	.container {
		display: grid;
		grid-template-rows: auto 1fr;

		height: 100vh;

		background-color: $gray-3;
	}

	.scroll-y {
		width: 100%;
		height: 100%;
		overflow-y: auto;
	}

	.centered-content {
		width: min(90%, 120vh);
		margin: auto;
	}
</style>
