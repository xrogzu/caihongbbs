package com.caihong.common.util;

import java.util.Collection;
import java.util.List;
import java.util.Map;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;

import net.sf.cglib.beans.BeanCopier;

public class BeanCopyUtils {
	@SuppressWarnings("rawtypes")
	public static <T> List<T> copyList(Collection sourceList, Class<T> destinationClass) {
		if (sourceList == null) {
			return null;
		}
		List<T> destinationList = Lists.newArrayList();
		for (Object sourceObject : sourceList) {
			T destinationObject;
			try {
				destinationObject = destinationClass.newInstance();
			} catch (InstantiationException | IllegalAccessException e) {
				destinationObject = null;
			}
			copy(sourceObject, destinationObject);
			destinationList.add(destinationObject);
		}
		return destinationList;
	}

	public static <K, T> Map<K, T> copyMap(Map<K, ?> sourceMap, Class<T> destinationClass){
		if (sourceMap == null) {
			return null;
		}
		Map<K, T> destinationMap = Maps.newHashMap();
		for (Object key : sourceMap.keySet()) {
			@SuppressWarnings("unchecked")
			K k = (K) key;
			T destinationObject;
			try {
				destinationObject = destinationClass.newInstance();
			} catch (InstantiationException | IllegalAccessException e) {
				destinationObject = null;
			}
			copy(sourceMap.get(key), destinationObject);
			destinationMap.put(k, destinationObject);
		}
		return destinationMap;
	}

	static final Map<String, BeanCopier> BEAN_COPIERS = Maps.newConcurrentMap();

	public static <F, T> void copy(F from, T to) {
		if (to == null || from == null) {
			return;
		}
		String key = from.getClass().getName() + to.getClass().getName();
		if (!BEAN_COPIERS.containsKey(key)) {
			BEAN_COPIERS.put(key, BeanCopier.create(from.getClass(), to.getClass(), false));
		}
		BEAN_COPIERS.get(key).copy(from, to, null);
	}
}
