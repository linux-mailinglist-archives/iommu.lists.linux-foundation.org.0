Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 3464E13C1E9
	for <lists.iommu@lfdr.de>; Wed, 15 Jan 2020 13:53:45 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id DC190203A3;
	Wed, 15 Jan 2020 12:53:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9h0vQSB7fXBF; Wed, 15 Jan 2020 12:53:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id ACF5C2051C;
	Wed, 15 Jan 2020 12:53:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9AA80C077D;
	Wed, 15 Jan 2020 12:53:39 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5D2B6C077D
 for <iommu@lists.linux-foundation.org>; Wed, 15 Jan 2020 12:53:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 58CC385C97
 for <iommu@lists.linux-foundation.org>; Wed, 15 Jan 2020 12:53:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Bi0B28GXObLU for <iommu@lists.linux-foundation.org>;
 Wed, 15 Jan 2020 12:53:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
 [209.85.128.68])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 80403844E9
 for <iommu@lists.linux-foundation.org>; Wed, 15 Jan 2020 12:53:33 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id q9so17757073wmj.5
 for <iommu@lists.linux-foundation.org>; Wed, 15 Jan 2020 04:53:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SVox6K0aClSgQAj4ZePzlVYlKOAA5RM1JxWE0eeJ+CM=;
 b=d82j4vm1o3BcAiDmH8LgzA/3vpHR0J1gWTn3QQfboZjYwEHmLjWkVdv0rRYfw8tFQD
 ZuKg7Rqy6hIQuC+dEDXPSLfFBVh4xfBVaqbdgIL1DjHmr5YQ0g8aBzYy3Kb+GHOJFU4L
 g6e/Md8hX8aJLbt7iWz2wb0JfPk+FA+VwfPFj8ARFZ/hHFjSIIJjUKBrW0X8Uw65/GFN
 pCj8ovv/3UsaefxbgelPQ8wVEKeHfYhcTtN2E+f84GERI489oXoalINk//Ix2yee5SSF
 +wfxiIYEG3WEI0GqJI+KNZVEJCgdOf8YjqzueruUlJfwuRyTHAExiMrKEJFJQ/Z+jnHY
 DS1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SVox6K0aClSgQAj4ZePzlVYlKOAA5RM1JxWE0eeJ+CM=;
 b=ajlh3LIblfkBqEkyggnf6focpzK5Ym1cW+MZ9MCCRFWLYSfS9uidIgGISi7yX4rSsK
 0sVXF6vM0/PeLSkOuqP1mrHPutoUhvokR31nTdoAnclUNqN3J3EkM6OSZWRgjyVHw0l5
 2GCodUhhTroOz3bEq7cwzWgdUMnJLmEIOjU4KdblPjgKFvI7CGHiRm24PtlKlo+tvjsT
 noaUhnUVdZwK674z2N3t7TT0rVV0/o+mugEfpVwKDo+unhDPl6cyImyc7GfsyrwdE/Dn
 RMiiap96M3nUOsQQqqLkn5ZEGjx6t+AWn2OU3ajETn0sTfLyzjm6HkgpWA3hn/G0Ukj6
 kzJg==
X-Gm-Message-State: APjAAAXsBTeelfZxeS5LPMWpLS7mtCJFE8qEndgLgoez+UDFAKV4Z4xs
 JfeisyC6k2O+jiScXgh67eGUPA==
X-Google-Smtp-Source: APXvYqzv6wpZNhXp0mYEPij61j3ANQSOgHf/a/RB8gE84eHpEFNB/mfELJUcr+OpmYAPFC/lrGboWA==
X-Received: by 2002:a1c:3187:: with SMTP id x129mr33613992wmx.91.1579092812076; 
 Wed, 15 Jan 2020 04:53:32 -0800 (PST)
Received: from localhost.localdomain
 ([2001:171b:2266:ba60:116c:c27a:3e7f:5eaf])
 by smtp.gmail.com with ESMTPSA id d12sm25196171wrp.62.2020.01.15.04.53.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jan 2020 04:53:31 -0800 (PST)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-acpi@vger.kernel.org, devicetree@vger.kernel.org,
 iommu@lists.linux-foundation.org, will@kernel.org
Subject: [PATCH v5 04/13] ACPI/IORT: Parse SSID property of named component
 node
Date: Wed, 15 Jan 2020 13:52:30 +0100
Message-Id: <20200115125239.136759-5-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200115125239.136759-1-jean-philippe@linaro.org>
References: <20200115125239.136759-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Cc: mark.rutland@arm.com, guohanjun@huawei.com, rjw@rjwysocki.net,
 robh+dt@kernel.org, sudeep.holla@arm.com, bhelgaas@google.com,
 zhangfei.gao@linaro.org, robin.murphy@arm.com, lenb@kernel.org
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

Named component nodes in the IORT tables describe the number of
Substream ID bits (aka. PASID) supported by the device. Propagate this
value to the fwspec structure in order to enable PASID for platform
devices.

Acked-by: Hanjun Guo <guohanjun@huawei.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 drivers/acpi/arm64/iort.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/acpi/arm64/iort.c b/drivers/acpi/arm64/iort.c
index 33f71983e001..39f389214ecf 100644
--- a/drivers/acpi/arm64/iort.c
+++ b/drivers/acpi/arm64/iort.c
@@ -11,6 +11,7 @@
 #define pr_fmt(fmt)	"ACPI: IORT: " fmt
 
 #include <linux/acpi_iort.h>
+#include <linux/bitfield.h>
 #include <linux/iommu.h>
 #include <linux/kernel.h>
 #include <linux/list.h>
@@ -924,6 +925,20 @@ static int iort_pci_iommu_init(struct pci_dev *pdev, u16 alias, void *data)
 	return iort_iommu_xlate(info->dev, parent, streamid);
 }
 
+static void iort_named_component_init(struct device *dev,
+				      struct acpi_iort_node *node)
+{
+	struct acpi_iort_named_component *nc;
+	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
+
+	if (!fwspec)
+		return;
+
+	nc = (struct acpi_iort_named_component *)node->node_data;
+	fwspec->num_pasid_bits = FIELD_GET(ACPI_IORT_NC_PASID_BITS,
+					   nc->node_flags);
+}
+
 /**
  * iort_iommu_configure - Set-up IOMMU configuration for a device.
  *
@@ -978,6 +993,9 @@ const struct iommu_ops *iort_iommu_configure(struct device *dev)
 			if (parent)
 				err = iort_iommu_xlate(dev, parent, streamid);
 		} while (parent && !err);
+
+		if (!err)
+			iort_named_component_init(dev, node);
 	}
 
 	/*
-- 
2.24.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
