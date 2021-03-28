Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 7778434C07F
	for <lists.iommu@lfdr.de>; Mon, 29 Mar 2021 02:11:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 132C883A4D;
	Mon, 29 Mar 2021 00:11:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EVazlaU-LG9k; Mon, 29 Mar 2021 00:11:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6FDEA83A5C;
	Mon, 29 Mar 2021 00:11:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5DD3BC001C;
	Mon, 29 Mar 2021 00:10:59 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4751DC000A
 for <iommu@lists.linux-foundation.org>; Sun, 28 Mar 2021 23:58:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 439A2838DE
 for <iommu@lists.linux-foundation.org>; Sun, 28 Mar 2021 23:58:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n0s_NqTwrNnJ for <iommu@lists.linux-foundation.org>;
 Sun, 28 Mar 2021 23:58:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com
 [IPv6:2607:f8b0:4864:20::f36])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AC3648387D
 for <iommu@lists.linux-foundation.org>; Sun, 28 Mar 2021 23:58:17 +0000 (UTC)
Received: by mail-qv1-xf36.google.com with SMTP id x27so5716319qvd.2
 for <iommu@lists.linux-foundation.org>; Sun, 28 Mar 2021 16:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=y32tInUapaLYbNEAI6jhNwCPrGHOxbt3T1h9KOpxef0=;
 b=IkSy4D1TkXi7lQMZ6smgafSA8mBcR9dJT0+IXc5N37pT9vxabM+SLMm50H4wvaA2Tp
 lk2+hXnLnaOUCms7sELVhOI/WPyeZdnXsdinIxZIuQnUF61PVACtUXO8CzQJmpUg/8F/
 kd/qUNl45u1Q/Z/y4MVvg7AMaZOTYLhOVHKm6Nt+ekWZZfILUbrp2yYgvZ/PqE0UZkxu
 yfiYNr5lsWA/xZeBftAd/5ys7cnmg2vNyOHsMfAKtVfKra3pkeqYar1Fa02kv/vB8uJB
 v4N4zgVPfp5L/JTA/n+36bVEt3mIlRbpaEf64PY4DjGrJu9ef2ZC8nn+a6/daLkbdFVL
 X/Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=y32tInUapaLYbNEAI6jhNwCPrGHOxbt3T1h9KOpxef0=;
 b=SkCrOMQAEUIxEeomc6No2rgvDDl8ke9GDdoaye5/qNVmDkFfK2hOQgN1NB5FtqygTN
 vGZIIZCWqz45MgY8L5YeOFX4GOXBs8MxMbs4HpLrfNw/316VyEVVSpbebYDJGQ4Aaf6u
 UvWGJ0mJgUUr/z3Jo3+4pzcvu4gZb118DteDV39eXmR/uhG7K/HnJvi149NQIfyMolHk
 7yRYLX3quVKauT7e0LayzA9IcrHS9OrMaEgT0YL0hnNedP9upJKz8nzq1E1gawG+r/BI
 uqjFuH54I5KUxBOQ5V6w8unM7SoOCgrZiG3hx+QoIXj7BSuM3Oob3YWnP0kc+VQDbJn9
 wErQ==
X-Gm-Message-State: AOAM532LvSEVuZcvYvQCkmIaTcxXuy4UrR7mhvdUSlAKj6hMJ0DwhCWg
 uUrJIwJUQWA+XZyb/zgUgzs=
X-Google-Smtp-Source: ABdhPJyWc3zpPzhGmj++XGZnoiKJeId7+5rJvoWlZFi+DgW1DNMSXYY/0RU9k5f3zIa31roOCCmQaw==
X-Received: by 2002:a0c:df02:: with SMTP id g2mr22816522qvl.40.1616975896740; 
 Sun, 28 Mar 2021 16:58:16 -0700 (PDT)
Received: from localhost.localdomain ([156.146.58.24])
 by smtp.gmail.com with ESMTPSA id y19sm12153061qky.111.2021.03.28.16.58.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Mar 2021 16:58:16 -0700 (PDT)
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: dmaengine@vger.kernel.org, dri-devel@lists.freedesktop.org, hch@lst.de,
 iommu@lists.linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 dave.jiang@intel.com, dan.j.williams@intel.com
Subject: [PATCH 28/30] usb-dmac.c: Fix a typo
Date: Mon, 29 Mar 2021 05:23:24 +0530
Message-Id: <7458e5dc5058076cf2ebe15de57c94927dcffcca.1616971780.git.unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <cover.1616971780.git.unixbhaskar@gmail.com>
References: <cover.1616971780.git.unixbhaskar@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 29 Mar 2021 00:10:51 +0000
Cc: rdunlap@infradead.org, Bhaskar Chowdhury <unixbhaskar@gmail.com>,
 linux-kernel@vger.kernel.org
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

s/descritpor/descriptor/

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 drivers/dma/sh/usb-dmac.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/sh/usb-dmac.c b/drivers/dma/sh/usb-dmac.c
index 8f7ceb698226..7092a657932b 100644
--- a/drivers/dma/sh/usb-dmac.c
+++ b/drivers/dma/sh/usb-dmac.c
@@ -301,7 +301,7 @@ static struct usb_dmac_desc *usb_dmac_desc_get(struct usb_dmac_chan *chan,
 	struct usb_dmac_desc *desc = NULL;
 	unsigned long flags;

-	/* Get a freed descritpor */
+	/* Get a freed descriptor */
 	spin_lock_irqsave(&chan->vc.lock, flags);
 	list_for_each_entry(desc, &chan->desc_freed, node) {
 		if (sg_len <= desc->sg_allocated_len) {
--
2.26.3

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
