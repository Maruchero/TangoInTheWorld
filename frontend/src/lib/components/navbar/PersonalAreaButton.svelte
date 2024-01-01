<script lang="ts">
	import { isAnyDropdownOpen, userPrivileges } from '$lib/stores';
	import Dropdown from '../Dropdown.svelte';

	let dropdownStatus = false;
	let dropdownOptions = $userPrivileges == 'guest' ? ['Login', 'Register'] : ['Options', 'Logout'];

	function toggleDropdown() {
		const newStatus = !dropdownStatus;
		isAnyDropdownOpen.set(false);
		isAnyDropdownOpen.set(newStatus);
		dropdownStatus = newStatus;
	}
</script>

<!-- HTML -->
<div class="icon">
	<button class="fa-solid fa-user" on:click={toggleDropdown} title="Area Utente"></button>
	<div class="dropdown">
		<Dropdown options={dropdownOptions} bind:opened={dropdownStatus}></Dropdown>
	</div>
</div>

<!-- STYLE -->
<style lang="scss">
	.icon {
		position: relative;
	}

	button {
		background: inherit;
		border: none;
		font-size: inherit;
		padding: 0;
	}

	.dropdown {
		position: absolute;
		bottom: 0;
		right: 0;
	}
</style>
