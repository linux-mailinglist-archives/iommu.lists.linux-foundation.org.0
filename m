Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B66F302419
	for <lists.iommu@lfdr.de>; Mon, 25 Jan 2021 12:09:00 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id EE9B086257;
	Mon, 25 Jan 2021 11:08:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NT98qeEyIFRc; Mon, 25 Jan 2021 11:08:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 94F33855B1;
	Mon, 25 Jan 2021 11:08:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 825ACC013A;
	Mon, 25 Jan 2021 11:08:58 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BFACAC013A
 for <iommu@lists.linux-foundation.org>; Mon, 25 Jan 2021 11:08:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id B8A4D2E153
 for <iommu@lists.linux-foundation.org>; Mon, 25 Jan 2021 11:08:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hh6MPGaYD-f7 for <iommu@lists.linux-foundation.org>;
 Mon, 25 Jan 2021 11:08:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by silver.osuosl.org (Postfix) with ESMTPS id 9F2D120508
 for <iommu@lists.linux-foundation.org>; Mon, 25 Jan 2021 11:08:54 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id a9so11868494wrt.5
 for <iommu@lists.linux-foundation.org>; Mon, 25 Jan 2021 03:08:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=P/EAy3wFo2SkAvzlEqANsfgzLeO0MB9eAURTmLNsvNA=;
 b=hn7k9YBrpbYNaKrAacJHgdQijWZghUPi3Iv6zU06UxFqaoM6CS1UbqtknoP0o2EYtg
 B4SlQ+8/0UDOp6kFcPYo7zeG7dDFCiQ42Bf8cd62mIK1oyjO5yqUyY5/Z9NO1CCEjIqF
 /AlTjnPryDQ833VP2jsLn7eScdSvT5H1N/afnru2UDmPA/nsLXS7u3+txOfIzwwlT2ED
 ixEkaN2yIDalNKbCKVn5d/Ji12naseZlZUxo+FJcEb0k1M0QCSwvdalS8aIAj+bOeTx2
 Bh2aW/dDFeqvnxAjNunComt/RSTHyfjg+DFVN85ttExE9Q2MlJKK4QEsbi23b+YkcRQH
 lsJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=P/EAy3wFo2SkAvzlEqANsfgzLeO0MB9eAURTmLNsvNA=;
 b=Mslh5AAnVTrR+gND+eTuhcpZuPT1YCEKkF6Wl+60t7euEFcutdGvnpVxyBytb2FrQ9
 RVXHxZblO99EmMvGc62EhGDHus91wxiXfNMQKo7VJTQugeV0+1m2acuzGW9LXxNNLmoU
 qqj4oSuVrYWnMfnggQ47hr2wjP1N9RyjNJlbsRfOicpiznG7GmTgSJvA0JUGgJ5gxY70
 OYpM0AW3kTWxz/v3hJVdX038/QtLC/Y1MwTRpbgvQzmUAmLx9A0lJ5bEpl3LniT/znr5
 mgoQIabFbmfZYgm+I04p1eMQ1zcBs5SDRy7BUTCb+Od0MYVjRUQJbpUrnZN6pNn2ICJz
 MqLA==
X-Gm-Message-State: AOAM531NDNZS7qSU5kDG2nEWdMEDJKrrcHmg7Ax9Xj6v9cugEvAsqWTC
 sdA/kACRAtpSTCozfgAvl+DDCg==
X-Google-Smtp-Source: ABdhPJyVElzzeAd4ZjJ6V4zQww4oY0c7GjWrC1TgJ7Hk43RJ5Qo9N0m7RbOAKVLJRgo9wI5qazqv3w==
X-Received: by 2002:adf:eed0:: with SMTP id a16mr293691wrp.107.1611572932965; 
 Mon, 25 Jan 2021 03:08:52 -0800 (PST)
Received: from localhost.localdomain
 ([2001:1715:4e26:a7e0:116c:c27a:3e7f:5eaf])
 by smtp.gmail.com with ESMTPSA id u6sm16636014wro.75.2021.01.25.03.08.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jan 2021 03:08:52 -0800 (PST)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: joro@8bytes.org,
	will@kernel.org
Subject: [PATCH v11 09/10] ACPI/IORT: Enable stall support for platform devices
Date: Mon, 25 Jan 2021 12:06:50 +0100
Message-Id: <20210125110650.3232195-10-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210125110650.3232195-1-jean-philippe@linaro.org>
References: <20210125110650.3232195-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Cc: vivek.gautam@arm.com, guohanjun@huawei.com,
 Jean-Philippe Brucker <jean-philippe@linaro.org>, linux-acpi@vger.kernel.org,
 zhangfei.gao@linaro.org, lenb@kernel.org, devicetree@vger.kernel.org,
 kevin.tian@intel.com, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 rjw@rjwysocki.net, iommu@lists.linux-foundation.org, sudeep.holla@arm.com,
 robin.murphy@arm.com, linux-accelerators@lists.ozlabs.org
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

Copy the "Stall supported" bit, that tells whether a named component
supports stall, into the dma-can-stall device property.

Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 drivers/acpi/arm64/iort.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/acpi/arm64/iort.c b/drivers/acpi/arm64/iort.c
index c9a8bbb74b09..42820d7eb869 100644
--- a/drivers/acpi/arm64/iort.c
+++ b/drivers/acpi/arm64/iort.c
@@ -968,13 +968,15 @@ static int iort_pci_iommu_init(struct pci_dev *pdev, u16 alias, void *data)
 static void iort_named_component_init(struct device *dev,
 				      struct acpi_iort_node *node)
 {
-	struct property_entry props[2] = {};
+	struct property_entry props[3] = {};
 	struct acpi_iort_named_component *nc;
 
 	nc = (struct acpi_iort_named_component *)node->node_data;
 	props[0] = PROPERTY_ENTRY_U32("pasid-num-bits",
 				      FIELD_GET(ACPI_IORT_NC_PASID_BITS,
 						nc->node_flags));
+	if (nc->node_flags & ACPI_IORT_NC_STALL_SUPPORTED)
+		props[1] = PROPERTY_ENTRY_BOOL("dma-can-stall");
 
 	if (device_add_properties(dev, props))
 		dev_warn(dev, "Could not add device properties\n");
-- 
2.30.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
