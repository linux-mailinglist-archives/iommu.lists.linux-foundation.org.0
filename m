Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id CC82D173E7E
	for <lists.iommu@lfdr.de>; Fri, 28 Feb 2020 18:29:03 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id F308A85DB1;
	Fri, 28 Feb 2020 17:29:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RpyaoZoolqjH; Fri, 28 Feb 2020 17:29:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 8FC3085D21;
	Fri, 28 Feb 2020 17:29:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7594DC1D84;
	Fri, 28 Feb 2020 17:29:00 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AFC2DC0177
 for <iommu@lists.linux-foundation.org>; Fri, 28 Feb 2020 17:28:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 9D9B688222
 for <iommu@lists.linux-foundation.org>; Fri, 28 Feb 2020 17:28:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PRXTRVXAxx84 for <iommu@lists.linux-foundation.org>;
 Fri, 28 Feb 2020 17:28:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
 [209.85.221.65])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 809CE88170
 for <iommu@lists.linux-foundation.org>; Fri, 28 Feb 2020 17:28:57 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id j16so3888816wrt.3
 for <iommu@lists.linux-foundation.org>; Fri, 28 Feb 2020 09:28:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EDWWoTJbUPJSVCIJnNm6Wi0YGdvuuWr/P/xyLJLCk5U=;
 b=H4pQ634+yQ7qGjgO8zR+xD8XcI9Di0PGvk0yGoDGT/LnLSteh5D+LF/aOTxvzyQKqL
 wszmDWK64moeyGZUDZGlntRAS/3Y5WyC9fSUFaK6YwNKzO0aHVq3gFzj6Tp4s4eQBwDV
 PcjhDt7clUVl21EiBFvydMX2zCpceyfoCxUSJHV0EpihzC1vEMdlCG27jIe5Rd/YLkof
 s9OvcH+UyBHP7odt6xKjYB1uMyZOvdSuwM6V1GHHOxb7sydbeai6HuPgxYNgKZ77SeQk
 MRoh/GxNqF47ccfCarTJ4OXZYk3y1qywuHrCBI9DRP9uo3IQxW3c9m1ycnZWqQ6MXxbw
 3LRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EDWWoTJbUPJSVCIJnNm6Wi0YGdvuuWr/P/xyLJLCk5U=;
 b=npiYnyi/xMHN59fz1SBEKSeQmBzqyZlvrNkjyQ4hCaYlfbU3XYr4YjKnPjQ+NvXQ0s
 KXCeY/ogDKfgX/wmbC+gZCz5195eEzadpiFASVsqW8SHsdbWtYEDWDFk5U0+ymEd/46X
 yjrWChiIOF9cnIjHneuARmtcpaXcNTaWnnOgvPClOXxugTLx3XEHNxu5v6nyS1mZmM/l
 58X2EtoXZi7Rw6SyPfwO/K3jqdfgv1/RKB0GFFUo+iTeBAPv0263N9aiGVRYZdHX/fuD
 33mV7m0zir6oXBwyRtC1ICAKXlFBNweYfA7VPT3DNdVGuAvkN0rbKMlWRSbWcWN6WAXy
 /SVg==
X-Gm-Message-State: APjAAAUiUyJZ3nUXzcvRGS/VqzKAiK33oJuF9x6Tw/6OpUV864c9y1Mh
 iwPqyEd3c7qvaIjzU/7VgSo23tengpE=
X-Google-Smtp-Source: APXvYqydXuly5JQHJ1HEed03Ol9Dp7NV7BSYwLykhnt9GR9cgCgCDHMep13CruAx/WMAigTJ+22vnQ==
X-Received: by 2002:adf:cc85:: with SMTP id p5mr5682702wrj.196.1582910935615; 
 Fri, 28 Feb 2020 09:28:55 -0800 (PST)
Received: from localhost.localdomain
 ([2001:171b:c9a8:fbc0:116c:c27a:3e7f:5eaf])
 by smtp.gmail.com with ESMTPSA id m125sm3004795wmf.8.2020.02.28.09.28.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Feb 2020 09:28:55 -0800 (PST)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: iommu@lists.linux-foundation.org,
 virtualization@lists.linux-foundation.org, linux-pci@vger.kernel.org
Subject: [PATCH v2 0/3] virtio-iommu on x86 and non-devicetree platforms
Date: Fri, 28 Feb 2020 18:25:35 +0100
Message-Id: <20200228172537.377327-1-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>, kevin.tian@intel.com,
 mst@redhat.com, sebastien.boeuf@intel.com, jacob.jun.pan@intel.com,
 bhelgaas@google.com, robin.murphy@arm.com, jasowang@redhat.com
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

Add a topology description to the virtio-iommu driver and enable x86
platforms.

Two minor changes since v1 [1]:
* Don't setup DMA twice in patch 1
* Clarify the CONFIG_IOMMU_DMA selection in patch 3

And rebased on top of "iommu/virtio: Build virtio-iommu as a module"
which Joerg picked up for v5.7.

--- Copy-paste from v1:
The built-in description is an array in the virtio config space. The
driver parses the config space early and postpones endpoint probe until
the virtio-iommu device is ready. Each element in the array describes
either a PCI range or a single MMIO endpoint, and their associated
endpoint IDs:

struct virtio_iommu_topo_pci_range {
	__le16 type;			/* 1: PCI range */
	__le16 hierarchy;		/* PCI domain number */
	__le16 requester_start;		/* First BDF */
	__le16 requester_end;		/* Last BDF */
	__le32 endpoint_start;		/* First endpoint ID */
};

struct virtio_iommu_topo_endpoint {
	__le16 type;			/* 2: Endpoint */
	__le16 reserved;		/* 0 */
	__le32 endpoint;		/* Endpoint ID */
	__le64 address;			/* First MMIO address */
};

You can find the QEMU patches based on Eric's latest device on my
virtio-iommu/devel branch [2]. I test on both x86 q35, and aarch64 virt
machine with edk2.
---

[1] https://lore.kernel.org/linux-iommu/20200214160413.1475396-1-jean-philippe@linaro.org/
[2] https://jpbrucker.net/git/qemu virtio-iommu/devel

Jean-Philippe Brucker (3):
  iommu/virtio: Add topology description to virtio-iommu config space
  PCI: Add DMA configuration for virtual platforms
  iommu/virtio: Enable x86 support

 MAINTAINERS                           |   2 +
 drivers/iommu/Kconfig                 |  13 +-
 drivers/iommu/Makefile                |   1 +
 drivers/iommu/virtio-iommu-topology.c | 343 ++++++++++++++++++++++++++
 drivers/iommu/virtio-iommu.c          |   3 +
 drivers/pci/pci-driver.c              |   5 +
 include/linux/virt_iommu.h            |  19 ++
 include/uapi/linux/virtio_iommu.h     |  26 ++
 8 files changed, 411 insertions(+), 1 deletion(-)
 create mode 100644 drivers/iommu/virtio-iommu-topology.c
 create mode 100644 include/linux/virt_iommu.h

-- 
2.25.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
