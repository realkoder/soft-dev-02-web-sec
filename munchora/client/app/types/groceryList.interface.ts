export const CATEGORIES = [
  'bakery 🥖',
  'beverages 🧋',
  'breakfast 🥣',
  'canned goods 🥫',
  'cleaning 🧼',
  'condiments 🧂',
  'dairy 🥚',
  'fish 🐟',
  'frozen foods ❄️',
  'fruits 🍎',
  'grains 🌾',
  'meat 🍗',
  'no category 📦',
  'pasta & rice 🍝',
  'personal care 🧴',
  'snacks 🍫',
  'spices & herbs 🌶️',
  'vegetables 🥦',
  'sauces & oils 🫙',
] as const;

export type TCategory = (typeof CATEGORIES)[number];

export interface IGroceryListItem {
  id: number;
  name: string;
  category?: TCategory;
  added_by?: string;
  is_completed: boolean;
  created_at: Date;
  updated_at: Date;
}

export interface IGroceryList {
  id: string;
  name: string;
  items: IGroceryListItem[];
  owner_id: string;
  shared_users: {
    id: string;
    first_name: string;
    last_name: string;
    image_src: string;
  }[];
  created_at: Date;
  updated_at: Date;
}

// CREATE OBJECTS

export interface IGroceryListItemInput {
  name: number;
  category?: TCategory;
  added_by?: string;
  is_completed: boolean;
}

export interface IGroceryListInput {
  name: string;
}
