Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 58967153DF
	for <lists.iommu@lfdr.de>; Mon,  6 May 2019 20:53:01 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id C50CB523D;
	Mon,  6 May 2019 18:52:59 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id B5E68500F
	for <iommu@lists.linux-foundation.org>;
	Mon,  6 May 2019 18:52:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 3085A836
	for <iommu@lists.linux-foundation.org>;
	Mon,  6 May 2019 18:52:57 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id a8so16341340edx.3
	for <iommu@lists.linux-foundation.org>;
	Mon, 06 May 2019 11:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=arista.com; s=googlenew;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=xOMG2HdbEZ3SrXQ8q7Gqb0A8n9cqtIr7U5g8ZrmeSwY=;
	b=jhxVShgPi56fhBmH6sXGURNSQPG8rifG26Da8orjFSRRc8gRE6k4Cv6HwdBHg4knfI
	l5tc2Q+doMEgflLHad6284EeKM+Hshw3o9FH3NdEkGrVsvtFV4R2axudVscNb2s97B7y
	TU8ZHMgrm2I96elHH5u5wUkhBml+5CSM0Bdrjpo6Z3hiwSnAQoLfuou4AItwdkOpsxed
	80lBtJ3c6s9ug68FFc8DHgEZ18q+zoY1HdpsnDLUDCZ8hzDP1k/iNQBJQXz0tnLVDZDA
	PjjVf3eEJQcaUVjosMg85BMeUtS+scBv/cwOJtifNVGUGwrOUDP6xQ2JB5R79hYAa3k2
	M/6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=xOMG2HdbEZ3SrXQ8q7Gqb0A8n9cqtIr7U5g8ZrmeSwY=;
	b=GC3kptxjqNyFOkqqKOjMwUqF3qvlbDwzllGHJji5kbiVUPiZ0IOW3M/VTkjeF1K4PH
	CXvrhO8eufFYGXzJfmadJaajgKiYKfhC6ckfHGq0pTyC/sDpLZzU8PpxYKKFFdq+5mbX
	BO1dNx5sjaVKMizpa4MPak78RrqxtwmO3tYwJCdUrxnQAPwv3WfjVGbMRtq/zvyw8tMo
	zr77mbeiZgMpgXgRNK/itxCYhRkOoBgUscQzfb3UF8LHewE9Beecj052WPEYYeFLGNlU
	9TKW3cEZbZ0dWuFu189oIO8/QwoECFobzv5kv6sO+7aabUk/9FqrxUo+uxI5UxbYv6L6
	3icQ==
X-Gm-Message-State: APjAAAW5eAbih6FUf1fevPVuDMtmACuSwfxJBanm/enRxTTQNRjwnw2c
	3CX1Epw9WibcDKoT4Pc0cXhuKdipFjqQ/Q==
X-Google-Smtp-Source: APXvYqx/0bwigCkWFM3Wz/6ksylC3p72YzFRn5H6iW89lDNU+bH1gdGYQluV+iLWz8wcDznRZGXmPg==
X-Received: by 2002:a17:906:469a:: with SMTP id
	a26mr20917778ejr.164.1557168775535; 
	Mon, 06 May 2019 11:52:55 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8084:a0:bc00:d9d9:922a:828d:a50e])
	by smtp.gmail.com with ESMTPSA id
	e35sm3361412eda.2.2019.05.06.11.52.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 06 May 2019 11:52:54 -0700 (PDT)
To: iommu@lists.linux-foundation.org
Subject: [PATCH v3 0/4] iommu/amd: Convert the AMD iommu driver to the
	dma-iommu api
Date: Mon,  6 May 2019 19:52:02 +0100
Message-Id: <20190506185207.31069-1-tmurphy@arista.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Heiko Stuebner <heiko@sntech.de>, Will Deacon <will.deacon@arm.com>,
	David Brown <david.brown@linaro.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	linux-s390@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>, linux-rockchip@lists.infradead.org,
	Kukjin Kim <kgene@kernel.org>,
	Gerald Schaefer <gerald.schaefer@de.ibm.com>,
	Andy Gross <andy.gross@linaro.org>, linux-tegra@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-arm-kernel@lists.infradead.org, Tom Murphy <tmurphy@arista.com>,
	Robin Murphy <robin.murphy@arm.com>,
	linux-kernel@vger.kernel.org, murphyt7@tcd.ie,
	David Woodhouse <dwmw2@infradead.org>
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
From: Tom Murphy via iommu <iommu@lists.linux-foundation.org>
Reply-To: Tom Murphy <tmurphy@arista.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

Convert the AMD iommu driver to the dma-iommu api. Remove the iova
handling and reserve region code from the AMD iommu driver.

Change-log:
v3:
-rename dma_limit to dma_mask
-exit handle_deferred_device early if (!is_kdump_kernel())
-remove pointless calls to handle_deferred_device
v2:
-Rebase on top of this series:
 http://git.infradead.org/users/hch/misc.git/shortlog/refs/heads/dma-iommu-ops.3
-Add a gfp_t parameter to the iommu_ops::map function.
-Made use of the reserve region code inside the dma-iommu api

Tom Murphy (4):
  iommu: Add gfp parameter to iommu_ops::map
  iommu/dma-iommu: Handle deferred devices
  iommu/dma-iommu: Use the dev->coherent_dma_mask
  iommu/amd: Convert the AMD iommu driver to the dma-iommu api

 drivers/iommu/Kconfig          |   1 +
 drivers/iommu/amd_iommu.c      | 694 ++++-----------------------------
 drivers/iommu/arm-smmu-v3.c    |   2 +-
 drivers/iommu/arm-smmu.c       |   2 +-
 drivers/iommu/dma-iommu.c      |  50 ++-
 drivers/iommu/exynos-iommu.c   |   2 +-
 drivers/iommu/intel-iommu.c    |   2 +-
 drivers/iommu/iommu.c          |  43 +-
 drivers/iommu/ipmmu-vmsa.c     |   2 +-
 drivers/iommu/msm_iommu.c      |   2 +-
 drivers/iommu/mtk_iommu.c      |   2 +-
 drivers/iommu/mtk_iommu_v1.c   |   2 +-
 drivers/iommu/omap-iommu.c     |   2 +-
 drivers/iommu/qcom_iommu.c     |   2 +-
 drivers/iommu/rockchip-iommu.c |   2 +-
 drivers/iommu/s390-iommu.c     |   2 +-
 drivers/iommu/tegra-gart.c     |   2 +-
 drivers/iommu/tegra-smmu.c     |   2 +-
 include/linux/iommu.h          |  21 +-
 19 files changed, 184 insertions(+), 653 deletions(-)

-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
