Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A1DF3FC5B3
	for <lists.iommu@lfdr.de>; Tue, 31 Aug 2021 12:37:24 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9DE49823AA;
	Tue, 31 Aug 2021 10:37:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6-fX_7sHsVZG; Tue, 31 Aug 2021 10:37:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 9FDE1823CF;
	Tue, 31 Aug 2021 10:37:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7C02AC000E;
	Tue, 31 Aug 2021 10:37:18 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B8F63C000E
 for <iommu@lists.linux-foundation.org>; Tue, 31 Aug 2021 10:37:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A6E604051B
 for <iommu@lists.linux-foundation.org>; Tue, 31 Aug 2021 10:37:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bytedance-com.20150623.gappssmtp.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JqtFJJb-ozRC for <iommu@lists.linux-foundation.org>;
 Tue, 31 Aug 2021 10:37:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 97D9F403A3
 for <iommu@lists.linux-foundation.org>; Tue, 31 Aug 2021 10:37:15 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id e16so14174515pfc.6
 for <iommu@lists.linux-foundation.org>; Tue, 31 Aug 2021 03:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CkhRtVDUgb41zlq5OfgVAHJFRMwL0PptQO/kVg6fccA=;
 b=wb1QmOQoMFVShBMn9y6KTytH5q1BZ0H1hJ3YO5uXgTFjLoGaoSepJJ5OlbhccHu/AJ
 wAiGO67xMVtU0t2LrJWcMBK/NhTSX6ZkR3DOqmyntbAg6jf+Cr1K9Cw8Xhb1KbRfFq5f
 0PiM2QpjLxqt7Y8TQAgsTNp6GYrUDvE9Lh/oajmuWt89WT4dDtxIROjBFBxpqguUKBU7
 LLMz+DXMsZEm4Eg593FHxtTTvCsA6fIWSzAN4+6DPx7X3FPKVNWqVAX/Kck7QYFDzzcC
 d2NfPV00YlGSbPc1qoUeYTZUD6zpXTRPBo7PsZ9aFWAnnS/G89GxBIlH9Z/mgTPMxFx/
 rbnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CkhRtVDUgb41zlq5OfgVAHJFRMwL0PptQO/kVg6fccA=;
 b=qDyv3xf+HhAUxninQQQ3DTP3tIB2UwYUHaE0AbEpxrjpsRTb8dV60aTA8bQrmcdqvg
 +rE+UUuUUss1mIsnwokgBOtZoi6h/s479DRNnzM1/GohHJyzePwEKr7EjWf+Vgd2RPKS
 Q87nrMqShS3OaezoheT9mxg0tAADeN+AuskopjFmbU1VwOybZ+S7V8eHc4AWgW4vzPzx
 wfEXZLAwPMQgdtU09Q3y7sF6FWatkX2GvYqXp6notCgCnJKoYT+cm09bpC+5TfSwegg5
 hip6NwViRQotxyfahiklTrB6/GsB+koXCtLwBSU7WkYMmcFUfrThvJzSeXz41GihvjIP
 7CEg==
X-Gm-Message-State: AOAM530u6d0/vWKNOnztPFR8qBn+gqQvqvmtnOm9v8AKbjRaHT4xm9KS
 0HSMcPL8VcUwdMwO8NTw2rek
X-Google-Smtp-Source: ABdhPJzBeHb26ioOoBceC1KZUNqQKw0qJ8cn0b2Nhenwq0dSjkYw4fqu/cKwDwROR4HestxrtqNmDQ==
X-Received: by 2002:aa7:999c:0:b0:3f2:8100:79c2 with SMTP id
 k28-20020aa7999c000000b003f2810079c2mr22685875pfh.80.1630406235060; 
 Tue, 31 Aug 2021 03:37:15 -0700 (PDT)
Received: from localhost ([139.177.225.253])
 by smtp.gmail.com with ESMTPSA id 15sm2641504pjw.39.2021.08.31.03.37.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Aug 2021 03:37:14 -0700 (PDT)
From: Xie Yongji <xieyongji@bytedance.com>
To: mst@redhat.com, jasowang@redhat.com, stefanha@redhat.com,
 sgarzare@redhat.com, parav@nvidia.com, hch@infradead.org,
 christian.brauner@canonical.com, rdunlap@infradead.org,
 willy@infradead.org, viro@zeniv.linux.org.uk, axboe@kernel.dk,
 bcrl@kvack.org, corbet@lwn.net, mika.penttila@nextfour.com,
 dan.carpenter@oracle.com, joro@8bytes.org, gregkh@linuxfoundation.org,
 zhe.he@windriver.com, xiaodong.liu@intel.com, joe@perches.com,
 robin.murphy@arm.com, will@kernel.org, john.garry@huawei.com
Subject: [PATCH v13 03/13] file: Export receive_fd() to modules
Date: Tue, 31 Aug 2021 18:36:24 +0800
Message-Id: <20210831103634.33-4-xieyongji@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210831103634.33-1-xieyongji@bytedance.com>
References: <20210831103634.33-1-xieyongji@bytedance.com>
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
Acked-by: Jason Wang <jasowang@redhat.com>
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
