Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id E2AAB3ACF06
	for <lists.iommu@lfdr.de>; Fri, 18 Jun 2021 17:30:25 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 634B240193;
	Fri, 18 Jun 2021 15:30:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W9ycwyozF8vN; Fri, 18 Jun 2021 15:30:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 76BC64023A;
	Fri, 18 Jun 2021 15:30:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3AF5AC0022;
	Fri, 18 Jun 2021 15:30:23 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 68671C000B
 for <iommu@lists.linux-foundation.org>; Fri, 18 Jun 2021 15:30:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 58F7E6073A
 for <iommu@lists.linux-foundation.org>; Fri, 18 Jun 2021 15:30:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=linaro.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y9wPgWe6D3Ze for <iommu@lists.linux-foundation.org>;
 Fri, 18 Jun 2021 15:30:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 344AF60733
 for <iommu@lists.linux-foundation.org>; Fri, 18 Jun 2021 15:30:20 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id og14so16522598ejc.5
 for <iommu@lists.linux-foundation.org>; Fri, 18 Jun 2021 08:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eVK2Vu+gdkSV5LfHLO/okFsTWTEsOSEgfh/fTAc+ysQ=;
 b=Uv8r73Tua8U4KIGVT0tadYn9JokQ3OI3UF40iCRRH8Qvy+JxNw6WWAESXCcrpkMZD5
 J9OqykH5gEpxXAEhSSHTNdSIYjDCvQfC/QG8Qn8WOqpOk/qeQwqcYl60Y0zNoDJ5dK9j
 vFVf3RcWUverAnEDhV8qhCSXORG1mEGHmaozp15j3vnM+1mkdqmBUJYcyKYaXKZ8/wX6
 DKVu6y5PKk/i85GATFRvHw3B3h6wkjYcKi++Q057tw7ivkm+LVe+yIYv2dbD8kDGryB8
 pCYO+t5K98NRFj1alr60VtctA8wlN3ilmyWo1HfKQowP1OpJjD8zQHLInL7HqZXFq5Dz
 zsYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eVK2Vu+gdkSV5LfHLO/okFsTWTEsOSEgfh/fTAc+ysQ=;
 b=pnpyIwJ6aX7802Nfj5CogjiqMNa27xIt3wCZm6hGb9cUjKd/28vWZWhewVJtyC0EW0
 ZtkVK/YvlrwmAJJYFqD5/qFU6gbVQAIivgyAYlvsAMBp2vm0pSDe65zz7j217nKga5KJ
 MDqEm0Foijptds1sNn1Xap0eONhX4QvGqdBIWt+Kpmoi/97kdFXPKHWBaJK19DQt8vTK
 ls0XkApGODlLlNSlERpgUvzdrYA/iMkNQz+b/YDZuNZlFQO2puYfXFsUPfdYWcHDbpm3
 b0EZ9QLXwZ9FqWXq/Uk4081bkEnw5PdJEl4KP+UrIdaDQL7xCVf94+akrZh7/Fhr3KOt
 WLqg==
X-Gm-Message-State: AOAM530+8qIXxNGSlma6l7g3x5FFlPCNYsmQgoTrkLIkQpYrnqLFRjt7
 5kf8ONItynZ7q+rLrXFtXE40bg==
X-Google-Smtp-Source: ABdhPJwqDmkoCnPG0QnncSmTulnYyA+q0tsJhnaPN0fg6rei1NJ1LtMquAgOeQDHr4MnGh/8I10l5Q==
X-Received: by 2002:a17:906:fcaa:: with SMTP id
 qw10mr11511312ejb.233.1624030218335; 
 Fri, 18 Jun 2021 08:30:18 -0700 (PDT)
Received: from localhost.localdomain (adsl-84-226-111-173.adslplus.ch.
 [84.226.111.173])
 by smtp.gmail.com with ESMTPSA id bn7sm1197613ejb.111.2021.06.18.08.30.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jun 2021 08:30:17 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: rjw@rjwysocki.net,
	lenb@kernel.org,
	joro@8bytes.org,
	mst@redhat.com
Subject: [PATCH v5 0/5] Add support for ACPI VIOT
Date: Fri, 18 Jun 2021 17:20:55 +0200
Message-Id: <20210618152059.1194210-1-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Cc: jean-philippe@linaro.org, kevin.tian@intel.com, catalin.marinas@arm.com,
 sudeep.holla@arm.com, robin.murphy@arm.com,
 virtualization@lists.linux-foundation.org, linux-acpi@vger.kernel.org,
 iommu@lists.linux-foundation.org, sebastien.boeuf@intel.com,
 guohanjun@huawei.com, will@kernel.org, dwmw2@infradead.org,
 linux-arm-kernel@lists.infradead.org
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

Add a driver for the ACPI VIOT table, which provides topology
information for para-virtual IOMMUs. Enable virtio-iommu on
non-devicetree platforms, including x86.

Since v4 [1]:
* Fixes (comments, wrong argument, unused variable)
* Removed patch 5 that wrongly moved set_dma_ops(dev, NULL) into dma-iommu.
  The simplification of limit parameters for x86 callers is now in patch 4.
* Release ACPI table after parsing
* Added review and tested tags, thanks for all the feedback!

You can find a QEMU implementation at [2], with extra support for
testing all VIOT nodes including MMIO-based endpoints and IOMMU.
This series is at [3].

[1] https://lore.kernel.org/linux-iommu/20210610075130.67517-1-jean-philippe@linaro.org/
[2] https://jpbrucker.net/git/qemu/log/?h=virtio-iommu/acpi
[3] https://jpbrucker.net/git/linux/log/?h=virtio-iommu/acpi

Jean-Philippe Brucker (5):
  ACPI: arm64: Move DMA setup operations out of IORT
  ACPI: Move IOMMU setup code out of IORT
  ACPI: Add driver for the VIOT table
  iommu/dma: Pass address limit rather than size to
    iommu_setup_dma_ops()
  iommu/virtio: Enable x86 support

 drivers/acpi/Kconfig         |   3 +
 drivers/iommu/Kconfig        |   4 +-
 drivers/acpi/Makefile        |   2 +
 drivers/acpi/arm64/Makefile  |   1 +
 include/acpi/acpi_bus.h      |   3 +
 include/linux/acpi.h         |   3 +
 include/linux/acpi_iort.h    |  14 +-
 include/linux/acpi_viot.h    |  19 ++
 include/linux/dma-iommu.h    |   4 +-
 arch/arm64/mm/dma-mapping.c  |   2 +-
 drivers/acpi/arm64/dma.c     |  50 +++++
 drivers/acpi/arm64/iort.c    | 128 ++----------
 drivers/acpi/bus.c           |   2 +
 drivers/acpi/scan.c          |  78 +++++++-
 drivers/acpi/viot.c          | 366 +++++++++++++++++++++++++++++++++++
 drivers/iommu/amd/iommu.c    |   2 +-
 drivers/iommu/dma-iommu.c    |  13 +-
 drivers/iommu/intel/iommu.c  |   5 +-
 drivers/iommu/virtio-iommu.c |  11 ++
 MAINTAINERS                  |   8 +
 20 files changed, 581 insertions(+), 137 deletions(-)
 create mode 100644 include/linux/acpi_viot.h
 create mode 100644 drivers/acpi/arm64/dma.c
 create mode 100644 drivers/acpi/viot.c

-- 
2.32.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
