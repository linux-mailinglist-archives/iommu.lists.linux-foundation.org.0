Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id B09B93A8224
	for <lists.iommu@lfdr.de>; Tue, 15 Jun 2021 16:14:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5791B405B5;
	Tue, 15 Jun 2021 14:14:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 47E5jMjgzXh8; Tue, 15 Jun 2021 14:14:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 205B340456;
	Tue, 15 Jun 2021 14:14:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EEC6AC000B;
	Tue, 15 Jun 2021 14:14:09 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5D252C000B
 for <iommu@lists.linux-foundation.org>; Tue, 15 Jun 2021 14:14:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 47F5A405D5
 for <iommu@lists.linux-foundation.org>; Tue, 15 Jun 2021 14:14:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q7fjasIsZRh8 for <iommu@lists.linux-foundation.org>;
 Tue, 15 Jun 2021 14:14:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6ACEF40325
 for <iommu@lists.linux-foundation.org>; Tue, 15 Jun 2021 14:14:07 +0000 (UTC)
Received: by mail-pg1-x530.google.com with SMTP id t9so11554396pgn.4
 for <iommu@lists.linux-foundation.org>; Tue, 15 Jun 2021 07:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=b7apvPbQfTG1FYg2uNsocmvMG/QdC7c4RuzNmrGKxtc=;
 b=teEC3X5118RCoqRjDpVinxrBxb/ZnCm6ryA5hTE///DNJNJIJ7ry41IlzLM/WQ5RZi
 5rM29Gvy1WbJsWL0k3ucFdrxybEvdyBmK744/4SAfTdXMBCd9dtjzdV6h4lNYp1H3YAe
 RaY/wxthVmrWQYX778EfdTQbqgDLnqWYzbbAUF0xXFFqFVkE4KxZ564GQjL0iwdHK9zR
 QipmY/L7g/sua/MKoU4gAbpjYDQ8XMk0LrElfchchmEY96U4NRRm7211KAJCMtvD/tLG
 2zK0nUfsHKDTzh/XdBfdvD4OZrzHRQtNECYGSoQtBcAELiDzP1QZt2UELiaroy3e2M1k
 QF/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=b7apvPbQfTG1FYg2uNsocmvMG/QdC7c4RuzNmrGKxtc=;
 b=qj6TsqnFyX8SOFkpMqZdQeLqFPMla8myuTkfRquVGYk/+S9MFLAt13NSsTO1UDyFvE
 uAs61nPgAJ3DBwhYxMGU9IIsqUrJFIpCYigv06+u/FhN0bX9gYlgIFAiXZlEp/Q7/8xL
 /OT8lnGqxNJ3684mzyWPPu7/ssGHVFo9XNPQV+6OCpRStBfrzbGGWO/7NyB5zpLwMKCO
 TYLv43rWKPrlC9kciQ7xqgWNyl0GFu9iGlm34bpapxsfZksB4/uLRhBp5PtUwZBgG1e6
 h8GpNoeefAO70vAxGk0sT+RhhjoGVQU3Q16ai1KhmgOGhpndZBU+dX6fctuLzZChybnB
 htZA==
X-Gm-Message-State: AOAM530XPm1da84LcJ3ocVcrQ9eN3OaePD6Ip8aG+KCl3Djs55nzO7dV
 DgZXLFql0FthqhyrSzQlV+7W
X-Google-Smtp-Source: ABdhPJzJT+1d1E8F4L3uwEMXEuWS3/RAonqjFcnOvR03YvpVA7eJh794mNzTaDsLprM6LBC/PxXhrA==
X-Received: by 2002:a63:9302:: with SMTP id b2mr3039614pge.277.1623766446912; 
 Tue, 15 Jun 2021 07:14:06 -0700 (PDT)
Received: from localhost ([139.177.225.241])
 by smtp.gmail.com with ESMTPSA id d8sm16097026pfq.198.2021.06.15.07.14.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 07:14:06 -0700 (PDT)
From: Xie Yongji <xieyongji@bytedance.com>
To: mst@redhat.com, jasowang@redhat.com, stefanha@redhat.com,
 sgarzare@redhat.com, parav@nvidia.com, hch@infradead.org,
 christian.brauner@canonical.com, rdunlap@infradead.org,
 willy@infradead.org, viro@zeniv.linux.org.uk, axboe@kernel.dk,
 bcrl@kvack.org, corbet@lwn.net, mika.penttila@nextfour.com,
 dan.carpenter@oracle.com, joro@8bytes.org, gregkh@linuxfoundation.org
Subject: [PATCH v8 03/10] eventfd: Increase the recursion depth of
 eventfd_signal()
Date: Tue, 15 Jun 2021 22:13:24 +0800
Message-Id: <20210615141331.407-4-xieyongji@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210615141331.407-1-xieyongji@bytedance.com>
References: <20210615141331.407-1-xieyongji@bytedance.com>
MIME-Version: 1.0
Cc: kvm@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, iommu@lists.linux-foundation.org,
 songmuchun@bytedance.com, linux-fsdevel@vger.kernel.org
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.15
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
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

Increase the recursion depth of eventfd_signal() to 1. This
is the maximum recursion depth we have found so far, which
can be triggered with the following call chain:

    kvm_io_bus_write                        [kvm]
      --> ioeventfd_write                   [kvm]
        --> eventfd_signal                  [eventfd]
          --> vhost_poll_wakeup             [vhost]
            --> vduse_vdpa_kick_vq          [vduse]
              --> eventfd_signal            [eventfd]

Signed-off-by: Xie Yongji <xieyongji@bytedance.com>
Acked-by: Jason Wang <jasowang@redhat.com>
---
 fs/eventfd.c            | 2 +-
 include/linux/eventfd.h | 5 ++++-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/fs/eventfd.c b/fs/eventfd.c
index e265b6dd4f34..cc7cd1dbedd3 100644
--- a/fs/eventfd.c
+++ b/fs/eventfd.c
@@ -71,7 +71,7 @@ __u64 eventfd_signal(struct eventfd_ctx *ctx, __u64 n)
 	 * it returns true, the eventfd_signal() call should be deferred to a
 	 * safe context.
 	 */
-	if (WARN_ON_ONCE(this_cpu_read(eventfd_wake_count)))
+	if (WARN_ON_ONCE(this_cpu_read(eventfd_wake_count) > EFD_WAKE_DEPTH))
 		return 0;
 
 	spin_lock_irqsave(&ctx->wqh.lock, flags);
diff --git a/include/linux/eventfd.h b/include/linux/eventfd.h
index fa0a524baed0..886d99cd38ef 100644
--- a/include/linux/eventfd.h
+++ b/include/linux/eventfd.h
@@ -29,6 +29,9 @@
 #define EFD_SHARED_FCNTL_FLAGS (O_CLOEXEC | O_NONBLOCK)
 #define EFD_FLAGS_SET (EFD_SHARED_FCNTL_FLAGS | EFD_SEMAPHORE)
 
+/* Maximum recursion depth */
+#define EFD_WAKE_DEPTH 1
+
 struct eventfd_ctx;
 struct file;
 
@@ -47,7 +50,7 @@ DECLARE_PER_CPU(int, eventfd_wake_count);
 
 static inline bool eventfd_signal_count(void)
 {
-	return this_cpu_read(eventfd_wake_count);
+	return this_cpu_read(eventfd_wake_count) > EFD_WAKE_DEPTH;
 }
 
 #else /* CONFIG_EVENTFD */
-- 
2.11.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
