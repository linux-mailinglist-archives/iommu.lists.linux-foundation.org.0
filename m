Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D1DD3D9E97
	for <lists.iommu@lfdr.de>; Thu, 29 Jul 2021 09:36:37 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EF05683ABF;
	Thu, 29 Jul 2021 07:36:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WmV08HB1IgJx; Thu, 29 Jul 2021 07:36:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 75BE783A54;
	Thu, 29 Jul 2021 07:36:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3FF3AC0022;
	Thu, 29 Jul 2021 07:36:33 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 96148C0010
 for <iommu@lists.linux-foundation.org>; Thu, 29 Jul 2021 07:36:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 787A740521
 for <iommu@lists.linux-foundation.org>; Thu, 29 Jul 2021 07:36:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bytedance-com.20150623.gappssmtp.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cVc9hZdYglNZ for <iommu@lists.linux-foundation.org>;
 Thu, 29 Jul 2021 07:36:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9D23A4053A
 for <iommu@lists.linux-foundation.org>; Thu, 29 Jul 2021 07:36:29 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id
 mz5-20020a17090b3785b0290176ecf64922so14251577pjb.3
 for <iommu@lists.linux-foundation.org>; Thu, 29 Jul 2021 00:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fvd20FCyGBljiGWMWOaikLGhtJL5n9pTt07FT1J+Aso=;
 b=fAKGRkP44Owwu4WMhbWuGxtEfRuOu4Cliti37qy1QkYokdFasOrHiHEwVppycUJDa3
 xeF9kkZtMqWVQcXx7XKdtgFjWeO1NCyZDLh3+kz3ApKsTKIU6gaqywKHV7mpMcUCrFV3
 zT4da+pmxdaGZe9kwFsedZAB26Rx93mb10YQroc3l8UwUi3VDv4fFVk6HznSiU7KP12l
 QvFB2dhPB1pvedlwjBrG+DbUl0EvD8waTHUa//y24vFctO0KTfe/zUc5erne7P/i6vAi
 PVBkdkxGHNypwS6VxgwTCHPCV7C/7vCsjPYfvADjwRWrvD7pN6kCS8dvfPAuJ1QD2QfH
 GWTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fvd20FCyGBljiGWMWOaikLGhtJL5n9pTt07FT1J+Aso=;
 b=Pp7ygbTBMr3OxL/AfL7w203WsuX2HW/vhP8/+6HryBQET56VdzHye/f0fU6ZVwWgZq
 D5RbAf2ZZ2fM2y51GyyiqoK+T7cvTevuNtWUNfLBzBIEedAT4BY4H3SFfaBm5Acpb6rN
 JIFMNBlKzaFgzC39Va/lqGdRdPg801JpZaxDcyfXxqhFTiijq28TDOZO5dIiT1GMkYf8
 0mmuSqAC40DqF0jKYKCqZQufhYAduOxF6zB6RpYIs25X89NGMNvWil7s7KL1dQkiWBVa
 whcCworKYUGvHpgkLIYQ7PogB5/BVm2xTqGOzPI7LhJtrhDNGKiMR6uqGmRWQUvSsT6L
 wb8Q==
X-Gm-Message-State: AOAM533YLqRqiPr/8Zic93d6lrrIWfqXuy/NXWPWFjlGq1J0tKKxOPgh
 JvMEsLEwsOV6MRrYrd19ChKT
X-Google-Smtp-Source: ABdhPJyVF72gj48BOfkqvU/dMdWjVFFjQBW8Tk1dwBDWNR4fUvBJh4VyPTlJiE+Mwgcny9FP/ET49Q==
X-Received: by 2002:a17:90a:19c2:: with SMTP id
 2mr3901952pjj.233.1627544189208; 
 Thu, 29 Jul 2021 00:36:29 -0700 (PDT)
Received: from localhost ([139.177.225.253])
 by smtp.gmail.com with ESMTPSA id i24sm2382500pfr.207.2021.07.29.00.36.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 00:36:28 -0700 (PDT)
From: Xie Yongji <xieyongji@bytedance.com>
To: mst@redhat.com, jasowang@redhat.com, stefanha@redhat.com,
 sgarzare@redhat.com, parav@nvidia.com, hch@infradead.org,
 christian.brauner@canonical.com, rdunlap@infradead.org,
 willy@infradead.org, viro@zeniv.linux.org.uk, axboe@kernel.dk,
 bcrl@kvack.org, corbet@lwn.net, mika.penttila@nextfour.com,
 dan.carpenter@oracle.com, joro@8bytes.org, gregkh@linuxfoundation.org,
 zhe.he@windriver.com, xiaodong.liu@intel.com, joe@perches.com
Subject: [PATCH v10 06/17] vhost-vdpa: Handle the failure of vdpa_reset()
Date: Thu, 29 Jul 2021 15:34:52 +0800
Message-Id: <20210729073503.187-7-xieyongji@bytedance.com>
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

The vdpa_reset() may fail now. This adds check to its return
value and fail the vhost_vdpa_open().

Signed-off-by: Xie Yongji <xieyongji@bytedance.com>
---
 drivers/vhost/vdpa.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/vhost/vdpa.c b/drivers/vhost/vdpa.c
index dd05c1e1133c..9a00b560abad 100644
--- a/drivers/vhost/vdpa.c
+++ b/drivers/vhost/vdpa.c
@@ -116,12 +116,13 @@ static void vhost_vdpa_unsetup_vq_irq(struct vhost_vdpa *v, u16 qid)
 	irq_bypass_unregister_producer(&vq->call_ctx.producer);
 }
 
-static void vhost_vdpa_reset(struct vhost_vdpa *v)
+static int vhost_vdpa_reset(struct vhost_vdpa *v)
 {
 	struct vdpa_device *vdpa = v->vdpa;
 
-	vdpa_reset(vdpa);
 	v->in_batch = 0;
+
+	return vdpa_reset(vdpa);
 }
 
 static long vhost_vdpa_get_device_id(struct vhost_vdpa *v, u8 __user *argp)
@@ -872,7 +873,9 @@ static int vhost_vdpa_open(struct inode *inode, struct file *filep)
 		return -EBUSY;
 
 	nvqs = v->nvqs;
-	vhost_vdpa_reset(v);
+	r = vhost_vdpa_reset(v);
+	if (r)
+		goto err;
 
 	vqs = kmalloc_array(nvqs, sizeof(*vqs), GFP_KERNEL);
 	if (!vqs) {
-- 
2.11.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
