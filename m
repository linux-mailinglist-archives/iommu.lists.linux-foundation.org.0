Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 9341218188C
	for <lists.iommu@lfdr.de>; Wed, 11 Mar 2020 13:47:08 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4440F8761C;
	Wed, 11 Mar 2020 12:47:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xv+iTbKJICtG; Wed, 11 Mar 2020 12:47:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 17A0187632;
	Wed, 11 Mar 2020 12:47:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0F075C0177;
	Wed, 11 Mar 2020 12:47:06 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E79F1C18D3
 for <iommu@lists.linux-foundation.org>; Wed, 11 Mar 2020 12:47:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id D6F5B85F71
 for <iommu@lists.linux-foundation.org>; Wed, 11 Mar 2020 12:47:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D7PIL4OotIMq for <iommu@lists.linux-foundation.org>;
 Wed, 11 Mar 2020 12:47:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
 [209.85.128.65])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 8060285F67
 for <iommu@lists.linux-foundation.org>; Wed, 11 Mar 2020 12:47:02 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id n8so1931599wmc.4
 for <iommu@lists.linux-foundation.org>; Wed, 11 Mar 2020 05:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=b6OCZpMX/zgjbiuYOZTv/yFn5g+Ml1pLP7pmNaB6uOk=;
 b=MjFUpxHpBskH8AZCa8gyvEeUFGWD8nE+I7Ccpw5x/EXEZNlkDfyhMtLIM9pIzDpMVv
 yv0WXrEyAyadtJ8laExtvI33SAK/Yj/XjyQUF33QkNa3LaJWSWjjXypqpRKmE99YyjLb
 Kzy38i8AKYH4slxDJSkaJhQqvJ0EyrgpZHy986v4LgMtDJY23CAifDPwM90WBTpJll1C
 aCNKlrXt1hD1ylm12EIODmL0J+kS46opQN5Wu90Eqk0d9OEv7vwJtW1G2hoWdmN9jEBN
 PsbTfgKubpyqXHQuVx5zuV7EXMF/qnMdkHydeM2T9wWjSBiZg5D3b6eUELp4nBntbfqe
 BObw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=b6OCZpMX/zgjbiuYOZTv/yFn5g+Ml1pLP7pmNaB6uOk=;
 b=VSLNogsyNO3UlrKnp2oBlbuboU2Z4KULDIAysyqbSy8Mb6gn2qWfDckWC0nG9DIEAE
 +kGbMCma4GbGuNPYzcEH+gEOyAe1YRbaF0i/umIv1gsZ3QQmQGhxSnpf5vMPQxZwFO+F
 A+FVFddEiLJxIwAlp+dyy/AJYcKU+JWmhO3pWEQkaTAmTBi3QPk2BIPuRjU07ud+ota9
 oKaGRevTd9yRT1KYEc620B0utbJVm7VmDq7OSRnq6otBsmHI0NT2LaDRgOOzhA+uYxT0
 sjSN5b0Lq7k5v2Phu0Cu3F4QEk8uBQJJ3N5Lu7T5/og5JclM1i5fww08/ExecEOqhqcQ
 B/Hw==
X-Gm-Message-State: ANhLgQ1LsI6+HqEtwgjn47ZwgGWROQ/s1WisTowhKypAQbUCOjkYSuQL
 xLQU65uM0Bt3A8h8J/0Jv4vjeg==
X-Google-Smtp-Source: ADFU+vtkHVanNQvPFzQ2zU8Odytq9w4wgEuuvipDqHybssyuXsKZkeB4j+7vEMafMywcklgaRLR7SA==
X-Received: by 2002:a7b:c414:: with SMTP id k20mr3677774wmi.119.1583930820944; 
 Wed, 11 Mar 2020 05:47:00 -0700 (PDT)
Received: from localhost.localdomain
 ([2001:171b:c9a8:fbc0:116c:c27a:3e7f:5eaf])
 by smtp.gmail.com with ESMTPSA id c2sm8380020wma.39.2020.03.11.05.46.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Mar 2020 05:47:00 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: bhelgaas@google.com, will@kernel.org, robh+dt@kernel.org, joro@8bytes.org,
 baolu.lu@linux.intel.com, sudeep.holla@arm.com, linux-doc@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-acpi@vger.kernel.org,
 iommu@lists.linux-foundation.org
Subject: [PATCH v2 05/11] PCI/ATS: Gather checks into pci_ats_supported()
Date: Wed, 11 Mar 2020 13:45:00 +0100
Message-Id: <20200311124506.208376-6-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200311124506.208376-1-jean-philippe@linaro.org>
References: <20200311124506.208376-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Cc: mark.rutland@arm.com, Jean-Philippe Brucker <jean-philippe@linaro.org>,
 frowand.list@gmail.com, corbet@lwn.net, liviu.dudau@arm.com, rjw@rjwysocki.net,
 guohanjun@huawei.com, amurray@thegoodpenguin.co.uk, robin.murphy@arm.com,
 dwmw2@infradead.org, lenb@kernel.org
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

IOMMU drivers need to perform several tests when checking if a device
supports ATS.  Move them all into a new function that returns true when
a device and its host bridge support ATS.

Since pci_enable_ats() now calls pci_ats_supported(), the following
new checks are now common:
* whether a device is trusted.  Devices plugged into external-facing
  ports such as thunderbolt are untrusted.
* whether the host bridge supports ATS, which defaults to true unless
  the firmware description states that ATS isn't supported by the host
  bridge.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 drivers/pci/ats.c       | 30 +++++++++++++++++++++++++++++-
 include/linux/pci-ats.h |  3 +++
 2 files changed, 32 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/ats.c b/drivers/pci/ats.c
index 390e92f2d8d1..bbfd0d42b8b9 100644
--- a/drivers/pci/ats.c
+++ b/drivers/pci/ats.c
@@ -30,6 +30,34 @@ void pci_ats_init(struct pci_dev *dev)
 	dev->ats_cap = pos;
 }
 
+/**
+ * pci_ats_supported - check if the device can use ATS
+ * @dev: the PCI device
+ *
+ * Returns true if the device supports ATS and is allowed to use it, false
+ * otherwise.
+ */
+bool pci_ats_supported(struct pci_dev *dev)
+{
+	struct pci_host_bridge *bridge;
+
+	if (!dev->ats_cap)
+		return false;
+
+	if (dev->untrusted)
+		return false;
+
+	bridge = pci_find_host_bridge(dev->bus);
+	if (!bridge)
+		return false;
+
+	if (!bridge->ats_supported)
+		return false;
+
+	return true;
+}
+EXPORT_SYMBOL_GPL(pci_ats_supported);
+
 /**
  * pci_enable_ats - enable the ATS capability
  * @dev: the PCI device
@@ -42,7 +70,7 @@ int pci_enable_ats(struct pci_dev *dev, int ps)
 	u16 ctrl;
 	struct pci_dev *pdev;
 
-	if (!dev->ats_cap)
+	if (!pci_ats_supported(dev))
 		return -EINVAL;
 
 	if (WARN_ON(dev->ats_enabled))
diff --git a/include/linux/pci-ats.h b/include/linux/pci-ats.h
index d08f0869f121..f75c307f346d 100644
--- a/include/linux/pci-ats.h
+++ b/include/linux/pci-ats.h
@@ -6,11 +6,14 @@
 
 #ifdef CONFIG_PCI_ATS
 /* Address Translation Service */
+bool pci_ats_supported(struct pci_dev *dev);
 int pci_enable_ats(struct pci_dev *dev, int ps);
 void pci_disable_ats(struct pci_dev *dev);
 int pci_ats_queue_depth(struct pci_dev *dev);
 int pci_ats_page_aligned(struct pci_dev *dev);
 #else /* CONFIG_PCI_ATS */
+static inline bool pci_ats_supported(struct pci_dev *d)
+{ return false; }
 static inline int pci_enable_ats(struct pci_dev *d, int ps)
 { return -ENODEV; }
 static inline void pci_disable_ats(struct pci_dev *d) { }
-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
