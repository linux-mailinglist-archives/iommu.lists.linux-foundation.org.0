Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E2EC83DA7
	for <lists.iommu@lfdr.de>; Wed,  7 Aug 2019 01:16:35 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 54738E28;
	Tue,  6 Aug 2019 23:16:20 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id B310ED9D
	for <iommu@lists.linux-foundation.org>;
	Tue,  6 Aug 2019 23:16:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id A86CD4C3
	for <iommu@lists.linux-foundation.org>;
	Tue,  6 Aug 2019 23:16:16 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id d23so86477174qto.2
	for <iommu@lists.linux-foundation.org>;
	Tue, 06 Aug 2019 16:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=nVKrlmqRR6AzMRTw6vUYnac58BnYRqdIo83XWmjM4P0=;
	b=pVg33LUAiJfK+ddVmka9bEGqbggf+ZJ/GOFvXeynM0R/aL21doedz+gpOItA6TWezc
	Co/ro2owT8ClSNxpeNKsrooka83hCNfTb/7E9HtnI9GJyCfPVFnvYPqllLrB4XRk0ZTU
	uwLnFN0f6nytZnVPbIhudGvFyDFKZimrU9or8Q27VPbwv7qiwvfNZTIKHcXqBBsIctKA
	IXDj6MqVFbWTgaWaf5k1YI0mpEdIFvgR4lJLcy6AR4U28Oh4i8XlYyhihGMMwJdfdWBA
	TvYKArEvsE/DYx3HQGC72o6o1IbPhpMX2+O0sT7sfDhCx9fYgtMGJ7djS/L6SlQkn9eK
	+rtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=nVKrlmqRR6AzMRTw6vUYnac58BnYRqdIo83XWmjM4P0=;
	b=l10AbeTrxiRK/B9mJaq5rTpyoHnMOdXseNQBJqD3CjQDiALulnEGifiNs3bSz+WD63
	LgnrtGQ9lamNmgr6sWtQqu7lT25kNzul6tmf4mqHqhEe9+v5hLv3HrivyGQ55VGKbnan
	e+3jmgh7nO1Tlb0Zm8Dk1sYBg84C5YkOSHq88mSygjsYk4AqNZxrPEvB0yJpEBPycMsR
	/IkflPJQoIJht0wI1bqaJ9UDPV6gUfY/QyKa7NbNAhNGgFDxphqioK4l6wSZdsqq/r7O
	dug6Pzk/wpQ+qiIdNs1e9RzHNEJ1yv+zxag1+dsakiO3xyCGOd26TYLMArRUU8irEfFU
	r3xQ==
X-Gm-Message-State: APjAAAVeiAsIVvzNejsRHEo4evWqgs/85hovUbZCEceJo95AndYGUj4R
	48iX2Ayrkz9Vq706Wz5WcZRy0A==
X-Google-Smtp-Source: APXvYqzhWOKQdmQJwz4hPX/uMgC+Ce6Qy7cZtY7qElskeP9tCAnQdyk3v8/xcYx29BbC2BJEkAyZyw==
X-Received: by 2002:ad4:4985:: with SMTP id t5mr5322961qvx.193.1565133375774; 
	Tue, 06 Aug 2019 16:16:15 -0700 (PDT)
Received: from ziepe.ca
	(hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
	[156.34.55.100]) by smtp.gmail.com with ESMTPSA id
	e1sm42932553qtb.52.2019.08.06.16.16.14
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 06 Aug 2019 16:16:14 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
	(envelope-from <jgg@ziepe.ca>)
	id 1hv8gg-0006eT-3A; Tue, 06 Aug 2019 20:16:14 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: linux-mm@kvack.org
Subject: [PATCH v3 hmm 03/11] mm/mmu_notifiers: add a get/put scheme for the
	registration
Date: Tue,  6 Aug 2019 20:15:40 -0300
Message-Id: <20190806231548.25242-4-jgg@ziepe.ca>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190806231548.25242-1-jgg@ziepe.ca>
References: <20190806231548.25242-1-jgg@ziepe.ca>
MIME-Version: 1.0
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Andrea Arcangeli <aarcange@redhat.com>,
	"David \(ChunMing\) Zhou" <David1.Zhou@amd.com>,
	Ralph Campbell <rcampbell@nvidia.com>, Dimitri Sivanich <sivanich@sgi.com>,
	Gavin Shan <shangw@linux.vnet.ibm.com>,
	Andrea Righi <andrea@betterlinux.com>,
	linux-rdma@vger.kernel.org, John Hubbard <jhubbard@nvidia.com>,
	"Kuehling, Felix" <Felix.Kuehling@amd.com>,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	=?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
	iommu@lists.linux-foundation.org, amd-gfx@lists.freedesktop.org,
	Jason Gunthorpe <jgg@mellanox.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	intel-gfx@lists.freedesktop.org, Christoph Hellwig <hch@lst.de>
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Development issues for Linux IOMMU support
	<iommu.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/iommu>,
	<mailto:iommu-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/iommu/>
List-Post: <mailto:iommu@lists.linux-foundation.org>
List-Help: <mailto:iommu-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/iommu>,
	<mailto:iommu-request@lists.linux-foundation.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

From: Jason Gunthorpe <jgg@mellanox.com>

Many places in the kernel have a flow where userspace will create some
object and that object will need to connect to the subsystem's
mmu_notifier subscription for the duration of its lifetime.

In this case the subsystem is usually tracking multiple mm_structs and it
is difficult to keep track of what struct mmu_notifier's have been
allocated for what mm's.

Since this has been open coded in a variety of exciting ways, provide core
functionality to do this safely.

This approach uses the strct mmu_notifier_ops * as a key to determine if
the subsystem has a notifier registered on the mm or not. If there is a
registration then the existing notifier struct is returned, otherwise the
ops->alloc_notifiers() is used to create a new per-subsystem notifier for
the mm.

The destroy side incorporates an async call_srcu based destruction which
will avoid bugs in the callers such as commit 6d7c3cde93c1 ("mm/hmm: fix
use after free with struct hmm in the mmu notifiers").

Since we are inside the mmu notifier core locking is fairly simple, the
allocation uses the same approach as for mmu_notifier_mm, the write side
of the mmap_sem makes everything deterministic and we only need to do
hlist_add_head_rcu() under the mm_take_all_locks(). The new users count
and the discoverability in the hlist is fully serialized by the
mmu_notifier_mm->lock.

Co-developed-by: Christoph Hellwig <hch@infradead.org>
Signed-off-by: Christoph Hellwig <hch@infradead.org>
Signed-off-by: Jason Gunthorpe <jgg@mellanox.com>
---
 include/linux/mmu_notifier.h |  35 ++++++++
 mm/mmu_notifier.c            | 156 +++++++++++++++++++++++++++++++++--
 2 files changed, 185 insertions(+), 6 deletions(-)

diff --git a/include/linux/mmu_notifier.h b/include/linux/mmu_notifier.h
index b6c004bd9f6ad9..31aa971315a142 100644
--- a/include/linux/mmu_notifier.h
+++ b/include/linux/mmu_notifier.h
@@ -211,6 +211,19 @@ struct mmu_notifier_ops {
 	 */
 	void (*invalidate_range)(struct mmu_notifier *mn, struct mm_struct *mm,
 				 unsigned long start, unsigned long end);
+
+	/*
+	 * These callbacks are used with the get/put interface to manage the
+	 * lifetime of the mmu_notifier memory. alloc_notifier() returns a new
+	 * notifier for use with the mm.
+	 *
+	 * free_notifier() is only called after the mmu_notifier has been
+	 * fully put, calls to any ops callback are prevented and no ops
+	 * callbacks are currently running. It is called from a SRCU callback
+	 * and cannot sleep.
+	 */
+	struct mmu_notifier *(*alloc_notifier)(struct mm_struct *mm);
+	void (*free_notifier)(struct mmu_notifier *mn);
 };
 
 /*
@@ -227,6 +240,9 @@ struct mmu_notifier_ops {
 struct mmu_notifier {
 	struct hlist_node hlist;
 	const struct mmu_notifier_ops *ops;
+	struct mm_struct *mm;
+	struct rcu_head rcu;
+	unsigned int users;
 };
 
 static inline int mm_has_notifiers(struct mm_struct *mm)
@@ -234,6 +250,21 @@ static inline int mm_has_notifiers(struct mm_struct *mm)
 	return unlikely(mm->mmu_notifier_mm);
 }
 
+struct mmu_notifier *mmu_notifier_get_locked(const struct mmu_notifier_ops *ops,
+					     struct mm_struct *mm);
+static inline struct mmu_notifier *
+mmu_notifier_get(const struct mmu_notifier_ops *ops, struct mm_struct *mm)
+{
+	struct mmu_notifier *ret;
+
+	down_write(&mm->mmap_sem);
+	ret = mmu_notifier_get_locked(ops, mm);
+	up_write(&mm->mmap_sem);
+	return ret;
+}
+void mmu_notifier_put(struct mmu_notifier *mn);
+void mmu_notifier_synchronize(void);
+
 extern int mmu_notifier_register(struct mmu_notifier *mn,
 				 struct mm_struct *mm);
 extern int __mmu_notifier_register(struct mmu_notifier *mn,
@@ -581,6 +612,10 @@ static inline void mmu_notifier_mm_destroy(struct mm_struct *mm)
 #define pudp_huge_clear_flush_notify pudp_huge_clear_flush
 #define set_pte_at_notify set_pte_at
 
+static inline void mmu_notifier_synchronize(void)
+{
+}
+
 #endif /* CONFIG_MMU_NOTIFIER */
 
 #endif /* _LINUX_MMU_NOTIFIER_H */
diff --git a/mm/mmu_notifier.c b/mm/mmu_notifier.c
index 696810f632ade1..4a770b5211b71d 100644
--- a/mm/mmu_notifier.c
+++ b/mm/mmu_notifier.c
@@ -248,6 +248,9 @@ int __mmu_notifier_register(struct mmu_notifier *mn, struct mm_struct *mm)
 	lockdep_assert_held_write(&mm->mmap_sem);
 	BUG_ON(atomic_read(&mm->mm_users) <= 0);
 
+	mn->mm = mm;
+	mn->users = 1;
+
 	if (!mm->mmu_notifier_mm) {
 		/*
 		 * kmalloc cannot be called under mm_take_all_locks(), but we
@@ -295,18 +298,24 @@ int __mmu_notifier_register(struct mmu_notifier *mn, struct mm_struct *mm)
 }
 EXPORT_SYMBOL_GPL(__mmu_notifier_register);
 
-/*
+/**
+ * mmu_notifier_register - Register a notifier on a mm
+ * @mn: The notifier to attach
+ * @mm : The mm to attach the notifier to
+ *
  * Must not hold mmap_sem nor any other VM related lock when calling
  * this registration function. Must also ensure mm_users can't go down
  * to zero while this runs to avoid races with mmu_notifier_release,
  * so mm has to be current->mm or the mm should be pinned safely such
  * as with get_task_mm(). If the mm is not current->mm, the mm_users
  * pin should be released by calling mmput after mmu_notifier_register
- * returns. mmu_notifier_unregister must be always called to
- * unregister the notifier. mm_count is automatically pinned to allow
- * mmu_notifier_unregister to safely run at any time later, before or
- * after exit_mmap. ->release will always be called before exit_mmap
- * frees the pages.
+ * returns.
+ *
+ * mmu_notifier_unregister() or mmu_notifier_put() must be always called to
+ * unregister the notifier.
+ *
+ * While the caller has a mmu_notifer get the mm pointer will remain valid,
+ * and can be converted to an active mm pointer via mmget_not_zero().
  */
 int mmu_notifier_register(struct mmu_notifier *mn, struct mm_struct *mm)
 {
@@ -319,6 +328,72 @@ int mmu_notifier_register(struct mmu_notifier *mn, struct mm_struct *mm)
 }
 EXPORT_SYMBOL_GPL(mmu_notifier_register);
 
+static struct mmu_notifier *
+find_get_mmu_notifier(struct mm_struct *mm, const struct mmu_notifier_ops *ops)
+{
+	struct mmu_notifier *mn;
+
+	spin_lock(&mm->mmu_notifier_mm->lock);
+	hlist_for_each_entry_rcu (mn, &mm->mmu_notifier_mm->list, hlist) {
+		if (mn->ops != ops)
+			continue;
+
+		if (likely(mn->users != UINT_MAX))
+			mn->users++;
+		else
+			mn = ERR_PTR(-EOVERFLOW);
+		spin_unlock(&mm->mmu_notifier_mm->lock);
+		return mn;
+	}
+	spin_unlock(&mm->mmu_notifier_mm->lock);
+	return NULL;
+}
+
+/**
+ * mmu_notifier_get_locked - Return the single struct mmu_notifier for
+ *                           the mm & ops
+ * @ops: The operations struct being subscribe with
+ * @mm : The mm to attach notifiers too
+ *
+ * This function either allocates a new mmu_notifier via
+ * ops->alloc_notifier(), or returns an already existing notifier on the
+ * list. The value of the ops pointer is used to determine when two notifiers
+ * are the same.
+ *
+ * Each call to mmu_notifier_get() must be paired with a caller to
+ * mmu_notifier_put(). The caller must hold the write side of mm->mmap_sem.
+ *
+ * While the caller has a mmu_notifer get the mm pointer will remain valid,
+ * and can be converted to an active mm pointer via mmget_not_zero().
+ */
+struct mmu_notifier *mmu_notifier_get_locked(const struct mmu_notifier_ops *ops,
+					     struct mm_struct *mm)
+{
+	struct mmu_notifier *mn;
+	int ret;
+
+	lockdep_assert_held_write(&mm->mmap_sem);
+
+	if (mm->mmu_notifier_mm) {
+		mn = find_get_mmu_notifier(mm, ops);
+		if (mn)
+			return mn;
+	}
+
+	mn = ops->alloc_notifier(mm);
+	if (IS_ERR(mn))
+		return mn;
+	mn->ops = ops;
+	ret = __mmu_notifier_register(mn, mm);
+	if (ret)
+		goto out_free;
+	return mn;
+out_free:
+	mn->ops->free_notifier(mn);
+	return ERR_PTR(ret);
+}
+EXPORT_SYMBOL_GPL(mmu_notifier_get_locked);
+
 /* this is called after the last mmu_notifier_unregister() returned */
 void __mmu_notifier_mm_destroy(struct mm_struct *mm)
 {
@@ -397,6 +472,75 @@ void mmu_notifier_unregister_no_release(struct mmu_notifier *mn,
 }
 EXPORT_SYMBOL_GPL(mmu_notifier_unregister_no_release);
 
+static void mmu_notifier_free_rcu(struct rcu_head *rcu)
+{
+	struct mmu_notifier *mn = container_of(rcu, struct mmu_notifier, rcu);
+	struct mm_struct *mm = mn->mm;
+
+	mn->ops->free_notifier(mn);
+	/* Pairs with the get in __mmu_notifier_register() */
+	mmdrop(mm);
+}
+
+/**
+ * mmu_notifier_put - Release the reference on the notifier
+ * @mn: The notifier to act on
+ *
+ * This function must be paired with each mmu_notifier_get(), it releases the
+ * reference obtained by the get. If this is the last reference then process
+ * to free the notifier will be run asynchronously.
+ *
+ * Unlike mmu_notifier_unregister() the get/put flow only calls ops->release
+ * when the mm_struct is destroyed. Instead free_notifier is always called to
+ * release any resources held by the user.
+ *
+ * As ops->release is not guaranteed to be called, the user must ensure that
+ * all sptes are dropped, and no new sptes can be established before
+ * mmu_notifier_put() is called.
+ *
+ * This function can be called from the ops->release callback, however the
+ * caller must still ensure it is called pairwise with mmu_notifier_get().
+ *
+ * Modules calling this function must call mmu_notifier_module_unload() in
+ * their __exit functions to ensure the async work is completed.
+ */
+void mmu_notifier_put(struct mmu_notifier *mn)
+{
+	struct mm_struct *mm = mn->mm;
+
+	spin_lock(&mm->mmu_notifier_mm->lock);
+	if (WARN_ON(!mn->users) || --mn->users)
+		goto out_unlock;
+	hlist_del_init_rcu(&mn->hlist);
+	spin_unlock(&mm->mmu_notifier_mm->lock);
+
+	call_srcu(&srcu, &mn->rcu, mmu_notifier_free_rcu);
+	return;
+
+out_unlock:
+	spin_unlock(&mm->mmu_notifier_mm->lock);
+}
+EXPORT_SYMBOL_GPL(mmu_notifier_put);
+
+/**
+ * mmu_notifier_synchronize - Ensure all mmu_notifiers are freed
+ *
+ * This function ensures that all outsanding async SRU work from
+ * mmu_notifier_put() is completed. After it returns any mmu_notifier_ops
+ * associated with an unused mmu_notifier will no longer be called.
+ *
+ * Before using the caller must ensure that all of its mmu_notifiers have been
+ * fully released via mmu_notifier_put().
+ *
+ * Modules using the mmu_notifier_put() API should call this in their __exit
+ * function to avoid module unloading races.
+ */
+void mmu_notifier_synchronize(void)
+{
+	synchronize_srcu(&srcu);
+}
+EXPORT_SYMBOL_GPL(mmu_notifier_synchronize);
+
 bool
 mmu_notifier_range_update_to_read_only(const struct mmu_notifier_range *range)
 {
-- 
2.22.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
