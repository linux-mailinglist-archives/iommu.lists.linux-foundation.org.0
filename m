Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id A0FE33C6C4B
	for <lists.iommu@lfdr.de>; Tue, 13 Jul 2021 10:47:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 105DB60887;
	Tue, 13 Jul 2021 08:47:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ijTDUyeS1d_I; Tue, 13 Jul 2021 08:47:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 227526087D;
	Tue, 13 Jul 2021 08:47:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D328FC0023;
	Tue, 13 Jul 2021 08:47:33 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 15EB4C000E
 for <iommu@lists.linux-foundation.org>; Tue, 13 Jul 2021 08:47:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B8467405D3
 for <iommu@lists.linux-foundation.org>; Tue, 13 Jul 2021 08:47:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bytedance-com.20150623.gappssmtp.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SuMhJyb2xSCM for <iommu@lists.linux-foundation.org>;
 Tue, 13 Jul 2021 08:47:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E8E54405C2
 for <iommu@lists.linux-foundation.org>; Tue, 13 Jul 2021 08:47:30 +0000 (UTC)
Received: by mail-pg1-x535.google.com with SMTP id w15so20987611pgk.13
 for <iommu@lists.linux-foundation.org>; Tue, 13 Jul 2021 01:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=x7lCOA+2uHcoDlHpnAPiyr08qHLnKknrRwhD42bW14c=;
 b=drxf3oJhygPSsqt71Ess67rxf+ndIQUhAGvJBQ7FfJc0EFN26/FzOtRTtC7PVm1UpN
 kQbh6cvZeXqEDwoNx0CPkFun1o95KcC72J/BrRHyWrL8j1ckCdBhsQrNaMArojnrxTDL
 EmSaEel9rQLb9Sl4sGu/b4+LJvaPa8chJvARj9AOwsZWRs4OZF+vghBIiQsIsYm4M9Ea
 tM/aLM4LHw9LpWwiWBNz+lg0l70CKpTeZGSiDnx8VQaiPHKV/RYUAN0tySvpbSXIWg/n
 CsQiMon3tJMRQHkqUdGOISGCwJp1P5f62r4sA52w48rVbKC6WaqVP0H4fqQAmdZ4e0TS
 niRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=x7lCOA+2uHcoDlHpnAPiyr08qHLnKknrRwhD42bW14c=;
 b=D7RiP/pDKetq4zdTSPdeXHCf9w6I5HK3mgYZLLqWKYR6FmX8NNlunQxyUqiRo5x+L7
 RlskAw+Ok4HrXbMo05Tb6MlNFHzdtwGbizj4/lUp7pwUCjjPcf+PTJa0t7LcqAocdnzM
 LcPjAwKhQ3fJVRpeAy3wPBf6lpVrjCvOihd5ASnTuDZN4JUtojrl8RQucCKIiAfNpUhp
 2erhb2EDoMRrQvpg8n7GygPSiQNwnCbdXS6DJQMplYQDACYfs0bLCBGqvuMpW6kOwKKS
 aj5BAFmhVPSfTYN3ihCbxYGWdTTjSV8q09YXRuENMriLQ8RAT1Q7meFOc4kDEYAo3Fd+
 eYNg==
X-Gm-Message-State: AOAM5304/xieASQOWs6ZDfLo4RFIE1QpGf978/vcM+WbPuloE8KxKJFA
 vhoAjGBWlekwPSODcsU1Bvh6
X-Google-Smtp-Source: ABdhPJwdRaHRXTGGcq8TKcIstM4ONkFGUJKEp5Fy9XmDOpn7i0jIsKMl/HA/2cyBqJh1EcfH1oJiyQ==
X-Received: by 2002:a63:5802:: with SMTP id m2mr3270429pgb.171.1626166050321; 
 Tue, 13 Jul 2021 01:47:30 -0700 (PDT)
Received: from localhost ([139.177.225.253])
 by smtp.gmail.com with ESMTPSA id z12sm15702430pjd.39.2021.07.13.01.47.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 01:47:29 -0700 (PDT)
From: Xie Yongji <xieyongji@bytedance.com>
To: mst@redhat.com, jasowang@redhat.com, stefanha@redhat.com,
 sgarzare@redhat.com, parav@nvidia.com, hch@infradead.org,
 christian.brauner@canonical.com, rdunlap@infradead.org,
 willy@infradead.org, viro@zeniv.linux.org.uk, axboe@kernel.dk,
 bcrl@kvack.org, corbet@lwn.net, mika.penttila@nextfour.com,
 dan.carpenter@oracle.com, joro@8bytes.org, gregkh@linuxfoundation.org,
 zhe.he@windriver.com, xiaodong.liu@intel.com
Subject: [PATCH v9 02/17] file: Export receive_fd() to modules
Date: Tue, 13 Jul 2021 16:46:41 +0800
Message-Id: <20210713084656.232-3-xieyongji@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210713084656.232-1-xieyongji@bytedance.com>
References: <20210713084656.232-1-xieyongji@bytedance.com>
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
