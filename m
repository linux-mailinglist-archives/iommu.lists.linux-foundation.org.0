Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C6F9398F4F
	for <lists.iommu@lfdr.de>; Wed,  2 Jun 2021 17:55:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2586960AD2;
	Wed,  2 Jun 2021 15:55:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JT5t0fei4TPQ; Wed,  2 Jun 2021 15:55:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2F4E06076F;
	Wed,  2 Jun 2021 15:55:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EDA35C0001;
	Wed,  2 Jun 2021 15:55:10 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 91B53C0001
 for <iommu@lists.linux-foundation.org>; Wed,  2 Jun 2021 15:55:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6EE7483CFC
 for <iommu@lists.linux-foundation.org>; Wed,  2 Jun 2021 15:55:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=linaro.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QpYVBgRqZSFj for <iommu@lists.linux-foundation.org>;
 Wed,  2 Jun 2021 15:55:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2914983C9D
 for <iommu@lists.linux-foundation.org>; Wed,  2 Jun 2021 15:55:08 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id ci15so4552113ejc.10
 for <iommu@lists.linux-foundation.org>; Wed, 02 Jun 2021 08:55:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hFWxCNmxdTSACAJCND+vZHUnFP/1fNZmOF1MWz4k5Tg=;
 b=yXNfKmP96TrMTc1Fw58DyLmvQouywbWAkFG+mPKml1w5NkKvkB7tlwVKXhtrYfhYuL
 9w34t/rrtl0+be93A97vYBsCY+/VKUxLlj4f3uPZUzrahRZiJrQIFpvIqdt6u8wJ1GSi
 t/c92oJh6YRWVXittEyYvx9/q5OnGstliwJ8LNicLtSeDy1YLd+Z9/XcynHpAFoew2Mb
 owOfd9AemYyanQavr+FDi0IpfYOVLzeUGY90Nf1+98UMK/MWSCptJb2bYGfH/ZG418E4
 hLqvoydYYo2MpGbBUYT4aKmM+gWXjTc4jpVg3fpg6VoYNqGAl7rMNDIhqlEed6Hdc2k4
 CcCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hFWxCNmxdTSACAJCND+vZHUnFP/1fNZmOF1MWz4k5Tg=;
 b=aY7CysZqZaGY4yrGkMayKZKUexwlzupP4vEO3LLGE7D0x0uCVS6amJIcmYS6BURx/9
 IVbU5ItM54SjSbmrwmiRhGvRvBYMLhoOhUfcgQjuh0i2nIUnChZ2NXf46YAAhTWIqTf3
 Lr1JZgLhIk636XkSw5l3OUnY41NL21y2okOquW17ocpjhgem1cd0ZavUbWXQ56ne2pt6
 oimcFWklvAu9SEB93lKlUUhYwiCWvVPzIE9omUuBuOsLS4s1DU8yzkdE+TPEnrFcN4fs
 mTiFfCpldfP+5c72TghfnjrJ2POD+r/mdP9abfxidoxklLdPuJUDuJal0xCk2qZ5ysXy
 2/Gw==
X-Gm-Message-State: AOAM5317ftywya6O5vykoeU7yNzKvNb+AIaNN07B1jwf1W2DUV2BSsrN
 1dE8wcw2YvujpF21QQq2NVya7g==
X-Google-Smtp-Source: ABdhPJyC6GnC05iD/ICy8SYDfXi0Ni8SzID9FIdZOYY8DSW/Pt+sIC1nio2rktwF7w8ITr6XN/uu6Q==
X-Received: by 2002:a17:906:f184:: with SMTP id
 gs4mr2311464ejb.420.1622649306228; 
 Wed, 02 Jun 2021 08:55:06 -0700 (PDT)
Received: from localhost.localdomain (adsl-84-226-111-173.adslplus.ch.
 [84.226.111.173])
 by smtp.gmail.com with ESMTPSA id d24sm174249edr.95.2021.06.02.08.55.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 08:55:05 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: rjw@rjwysocki.net,
	lenb@kernel.org,
	joro@8bytes.org,
	mst@redhat.com
Subject: [PATCH v3 0/6] Add support for ACPI VIOT
Date: Wed,  2 Jun 2021 17:44:40 +0200
Message-Id: <20210602154444.1077006-1-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.31.1
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

Since v2 [1] I tried to improve commit messages and comments. More
feedback and review are always welcome. Joerg offered to take this
series through the IOMMU tree, which requires acks for patches 1-3.

You can find a QEMU implementation at [2], with extra support for
testing all VIOT nodes including MMIO-based endpoints and IOMMU.
This series is at [3].

[1] https://lore.kernel.org/linux-iommu/20210423113836.3974972-1-jean-philippe@linaro.org/
[2] https://jpbrucker.net/git/qemu/log/?h=virtio-iommu/acpi
[3] https://jpbrucker.net/git/linux/log/?h=virtio-iommu/acpi

Jean-Philippe Brucker (6):
  ACPI: arm64: Move DMA setup operations out of IORT
  ACPI: Move IOMMU setup code out of IORT
  ACPI: Add driver for the VIOT table
  iommu/dma: Pass address limit rather than size to
    iommu_setup_dma_ops()
  iommu/dma: Simplify calls to iommu_setup_dma_ops()
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
 drivers/acpi/arm64/iort.c    | 129 ++-----------
 drivers/acpi/bus.c           |   2 +
 drivers/acpi/scan.c          |  60 +++++-
 drivers/acpi/viot.c          | 364 +++++++++++++++++++++++++++++++++++
 drivers/iommu/amd/iommu.c    |   9 +-
 drivers/iommu/dma-iommu.c    |  17 +-
 drivers/iommu/intel/iommu.c  |  10 +-
 drivers/iommu/virtio-iommu.c |   8 +
 MAINTAINERS                  |   8 +
 20 files changed, 562 insertions(+), 150 deletions(-)
 create mode 100644 include/linux/acpi_viot.h
 create mode 100644 drivers/acpi/arm64/dma.c
 create mode 100644 drivers/acpi/viot.c

-- 
2.31.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
