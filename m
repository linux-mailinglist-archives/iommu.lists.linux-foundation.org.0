Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id BB6313D9E8B
	for <lists.iommu@lfdr.de>; Thu, 29 Jul 2021 09:36:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 33BC1836F0;
	Thu, 29 Jul 2021 07:36:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id txt-dPNJGVhn; Thu, 29 Jul 2021 07:36:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 51E9E83ABF;
	Thu, 29 Jul 2021 07:36:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2DE8CC0022;
	Thu, 29 Jul 2021 07:36:13 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A6F78C000E
 for <iommu@lists.linux-foundation.org>; Thu, 29 Jul 2021 07:36:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 887AD40319
 for <iommu@lists.linux-foundation.org>; Thu, 29 Jul 2021 07:36:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bytedance-com.20150623.gappssmtp.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QSyDKmbbHEgo for <iommu@lists.linux-foundation.org>;
 Thu, 29 Jul 2021 07:36:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 137D540521
 for <iommu@lists.linux-foundation.org>; Thu, 29 Jul 2021 07:36:08 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id e5so5942324pld.6
 for <iommu@lists.linux-foundation.org>; Thu, 29 Jul 2021 00:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=x7lCOA+2uHcoDlHpnAPiyr08qHLnKknrRwhD42bW14c=;
 b=L3+zrqxq1jDIch5mBMRlq4aMkZWeJXNgz//RgYj4u3V1lMU7q20ZSp16442c0mWaWo
 3pimykQ5c3xo5hFxpe8YP2kPqJRUDXMEfySemYatlQJMfgm4TKPWnxljrQ4scQVJVmAe
 SgYBeBiHSj6pBrjI7edJBnGY1o6V08/DYlBoSrgQMsrmRK906zgqaAWchZrUKOHWJ1s2
 G28MPqjFEY3cvBXfzP0Rxts8xu3e5wgWbnD4qAUWn0c4JOpCgg0t7ExynJrXsb/Lqv0X
 wvgLL4SNtH3zcQoSC98vHFIPnTb8V3qERqJnvlidDS9Zlh9UapAb0RrBTxogd7yCCZ8j
 K9/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=x7lCOA+2uHcoDlHpnAPiyr08qHLnKknrRwhD42bW14c=;
 b=s/5cUFCWT4p87dgNN365tnLZBcf8NBNtZu79YWmOYRRKwTb5uvpl10NoWCSj/Mb4ms
 p9kZasUjN87keeLFCcb3lvXyxSkyAsuD6oIwUGE2KM7KJWPOn50J8l6B+/KK4OL3Sd43
 RKS6QIis9Q34YQzoOBWzBp6jSLfuDY9KvtJgmPUKzlwgkfAlm8no+BywNXxprHIkbir2
 vIwdEh9tBtIXqINxcznKeGR5U4KrKaJSwBEqekf+PWCN0yUJnHTnDDW65d3WYBY9gaZx
 BSPfL+JNnSnidzOzsXMFzygQnauLlYdbjf1fXebZnnIraNwrl8WZrw5CSN37JZx1Y9HF
 k+8w==
X-Gm-Message-State: AOAM530LxjK2RKFGXaGBt0OchBen0UPYcKVVnAFpIp8IXGsnDHiiL2Ve
 mWcRH9YPUeNq+yCs4Vi52IOA
X-Google-Smtp-Source: ABdhPJz6gtDSzVbKQwR9fMTMuBAxDE/HudL65A5sjPsB1aFvsDsAWmfl9tE1fqIYigp4LRfAx1lPGg==
X-Received: by 2002:a62:804b:0:b029:328:db41:1f47 with SMTP id
 j72-20020a62804b0000b0290328db411f47mr3610895pfd.43.1627544168542; 
 Thu, 29 Jul 2021 00:36:08 -0700 (PDT)
Received: from localhost ([139.177.225.253])
 by smtp.gmail.com with ESMTPSA id y8sm2535031pfe.162.2021.07.29.00.36.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 00:36:08 -0700 (PDT)
From: Xie Yongji <xieyongji@bytedance.com>
To: mst@redhat.com, jasowang@redhat.com, stefanha@redhat.com,
 sgarzare@redhat.com, parav@nvidia.com, hch@infradead.org,
 christian.brauner@canonical.com, rdunlap@infradead.org,
 willy@infradead.org, viro@zeniv.linux.org.uk, axboe@kernel.dk,
 bcrl@kvack.org, corbet@lwn.net, mika.penttila@nextfour.com,
 dan.carpenter@oracle.com, joro@8bytes.org, gregkh@linuxfoundation.org,
 zhe.he@windriver.com, xiaodong.liu@intel.com, joe@perches.com
Subject: [PATCH v10 02/17] file: Export receive_fd() to modules
Date: Thu, 29 Jul 2021 15:34:48 +0800
Message-Id: <20210729073503.187-3-xieyongji@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210729073503.187-1-xieyongji@bytedance.com>
References: <20210729073503.187-1-xieyongji@bytedance.com>
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

Export receive_fd() so that some modules can use
it to pass file descriptor between processes without
missing any security stuffs.

Signed-off-by: Xie Yongji <xieyongji@bytedance.com>
---
 fs/file.c            | 6 ++++++
 include/linux/file.h | 7 +++----
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/fs/file.c b/fs/file.c
index 86dc9956af32..210e540672aa 100644
--- a/fs/file.c
+++ b/fs/file.c
@@ -1134,6 +1134,12 @@ int receive_fd_replace(int new_fd, struct file *file, unsigned int o_flags)
 	return new_fd;
 }
 
+int receive_fd(struct file *file, unsigned int o_flags)
+{
+	return __receive_fd(file, NULL, o_flags);
+}
+EXPORT_SYMBOL_GPL(receive_fd);
+
 static int ksys_dup3(unsigned int oldfd, unsigned int newfd, int flags)
 {
 	int err = -EBADF;
diff --git a/include/linux/file.h b/include/linux/file.h
index 2de2e4613d7b..51e830b4fe3a 100644
--- a/include/linux/file.h
+++ b/include/linux/file.h
@@ -94,6 +94,9 @@ extern void fd_install(unsigned int fd, struct file *file);
 
 extern int __receive_fd(struct file *file, int __user *ufd,
 			unsigned int o_flags);
+
+extern int receive_fd(struct file *file, unsigned int o_flags);
+
 static inline int receive_fd_user(struct file *file, int __user *ufd,
 				  unsigned int o_flags)
 {
@@ -101,10 +104,6 @@ static inline int receive_fd_user(struct file *file, int __user *ufd,
 		return -EFAULT;
 	return __receive_fd(file, ufd, o_flags);
 }
-static inline int receive_fd(struct file *file, unsigned int o_flags)
-{
-	return __receive_fd(file, NULL, o_flags);
-}
 int receive_fd_replace(int new_fd, struct file *file, unsigned int o_flags);
 
 extern void flush_delayed_fput(void);
-- 
2.11.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
