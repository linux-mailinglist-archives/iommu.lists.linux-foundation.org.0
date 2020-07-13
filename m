Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F8E21D2E3
	for <lists.iommu@lfdr.de>; Mon, 13 Jul 2020 11:35:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D070987546;
	Mon, 13 Jul 2020 09:35:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2fLln_9hzmvH; Mon, 13 Jul 2020 09:35:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2794B87386;
	Mon, 13 Jul 2020 09:35:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0B2FAC0733;
	Mon, 13 Jul 2020 09:35:25 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E8CF5C0733
 for <iommu@lists.linux-foundation.org>; Mon, 13 Jul 2020 09:12:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id E2BD42037E
 for <iommu@lists.linux-foundation.org>; Mon, 13 Jul 2020 09:12:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N8x-i9kxETih for <iommu@lists.linux-foundation.org>;
 Mon, 13 Jul 2020 09:12:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 by silver.osuosl.org (Postfix) with ESMTPS id 1470D2002F
 for <iommu@lists.linux-foundation.org>; Mon, 13 Jul 2020 09:12:36 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id m16so4054788pls.5
 for <iommu@lists.linux-foundation.org>; Mon, 13 Jul 2020 02:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8w3F7eoFwp6zTrsEU3OM3mMV9A6pzMUaFVXnW/3/+00=;
 b=oSanfCWgfwp8BUU/AtaHKnrnFjyipfAuA6RrtCob1El3wIsNjk3Lz7nVseBIur745f
 OY+EXDexxnKeOkeInxuEt8v1TPNShMb17GnoHCHNIunyQndCSeKOfqt7gDQn4JwBERtR
 i/HFX/5oj8Hlgz5PMzsaQt/442K/YfrP18AqU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8w3F7eoFwp6zTrsEU3OM3mMV9A6pzMUaFVXnW/3/+00=;
 b=uNE0rGYn4gDjjP5GY3eYcVvVp+RxNqo/kb2oU9DdCVlS2HwbkzsZkZq3FDuNxVQpts
 SCeMd1fk5+rHN1Rg7mpd4FhRbxyLv3n/AFCC0CwfjfO4mfTr1aPn+4hHXKso1CgA68Xq
 HejSRAnEi0O0eUvxIsEx9Igso02xHg8E202F5nsiUdtSq6fF8rIP6cDt8d6Trqr2m2zv
 BmdoM/mqC5bC2d4IoW47K321iNCtdQ4YAasmIeC60YdFoArjIWsfPtuAup/duCp8uqLa
 IAfB9NHkHuIM7i8n+YkoXTZlGjscRnktOWgc9C+xh3JTro4fXbxPVHWmOGtgLRBSiNcM
 u8xw==
X-Gm-Message-State: AOAM530sJwERoS7FfPQ8qDWkHVJQqUdPT8rZ/vctt+045l9RgJ+poyAD
 xQ0W2i9o93tFVRFXWxjp+Qrjew==
X-Google-Smtp-Source: ABdhPJz/bPSgglZGd/h8Rf2Rip53WAhFlRZHiMx+kJEU3tD3iG9U0Yk8dgrlkb9pjI7czOfCiq86+g==
X-Received: by 2002:a17:90a:b10e:: with SMTP id
 z14mr16344354pjq.146.1594631555662; 
 Mon, 13 Jul 2020 02:12:35 -0700 (PDT)
Received: from localhost ([2401:fa00:1:10:3e52:82ff:fe5e:cc9d])
 by smtp.gmail.com with ESMTPSA id b6sm14000538pfp.0.2020.07.13.02.12.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jul 2020 02:12:34 -0700 (PDT)
From: Claire Chang <tientzu@chromium.org>
To: robh+dt@kernel.org, frowand.list@gmail.com, hch@lst.de,
 m.szyprowski@samsung.com, robin.murphy@arm.com
Subject: [PATCH 0/4] Bounced DMA support
Date: Mon, 13 Jul 2020 17:12:07 +0800
Message-Id: <20200713091211.2183368-1-tientzu@chromium.org>
X-Mailer: git-send-email 2.27.0.383.g050319c2ae-goog
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 13 Jul 2020 09:35:23 +0000
Cc: devicetree@vger.kernel.org, heikki.krogerus@linux.intel.com,
 saravanak@google.com, suzuki.poulose@arm.com, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, bgolaszewski@baylibre.com,
 iommu@lists.linux-foundation.org, drinkcat@chromium.org,
 Claire Chang <tientzu@chromium.org>, dan.j.williams@intel.com,
 treding@nvidia.com
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

This series implements mitigations for lack of DMA access control on
systems without an IOMMU, which could result in the DMA accessing the
system memory at unexpected times and/or unexpected addresses, possibly
leading to data leakage or corruption.

For example, we plan to use the PCI-e bus for Wi-Fi and that PCI-e bus
is not behind an IOMMU. As PCI-e, by design, gives the device full
access to system memory, a vulnerability in the Wi-Fi firmware could
easily escalate to a full system exploit (remote wifi exploits: [1a],
[1b] that shows a full chain of exploits; [2], [3]).

To mitigate the security concerns, we introduce bounced DMA. The bounced
DMA ops provide an implementation of DMA ops that bounce streaming DMA
in and out of a specially allocated region. The feature on its own
provides a basic level of protection against the DMA overwriting buffer
contents at unexpected times. However, to protect against general data
leakage and system memory corruption, the system needs to provide a way
to restrict the DMA to a predefined memory region (this is usually done
at firmware level, e.g. in ATF on some ARM platforms).

Currently, 32-bit architectures are not supported because of the need to
handle HIGHMEM, which increases code complexity and adds more
performance penalty for such platforms. Also, bounced DMA can not be
enabled on devices behind an IOMMU, as those require an IOMMU-aware
implementation of DMA ops and do not require this kind of mitigation
anyway.

[1a] https://googleprojectzero.blogspot.com/2017/04/over-air-exploiting-broadcoms-wi-fi_4.html
[1b] https://googleprojectzero.blogspot.com/2017/04/over-air-exploiting-broadcoms-wi-fi_11.html
[2] https://blade.tencent.com/en/advisories/qualpwn/
[3] https://www.bleepingcomputer.com/news/security/vulnerabilities-found-in-highly-popular-firmware-for-wifi-chips/


Claire Chang (4):
  dma-mapping: Add bounced DMA ops
  dma-mapping: Add bounced DMA pool
  dt-bindings: of: Add plumbing for bounced DMA pool
  of: Add plumbing for bounced DMA pool

 .../reserved-memory/reserved-memory.txt       |  36 +++
 drivers/of/address.c                          |  37 +++
 drivers/of/device.c                           |   3 +
 drivers/of/of_private.h                       |   6 +
 include/linux/device.h                        |   3 +
 include/linux/dma-mapping.h                   |   1 +
 kernel/dma/Kconfig                            |  17 +
 kernel/dma/Makefile                           |   1 +
 kernel/dma/bounced.c                          | 304 ++++++++++++++++++
 9 files changed, 408 insertions(+)
 create mode 100644 kernel/dma/bounced.c

-- 
2.27.0.383.g050319c2ae-goog

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
