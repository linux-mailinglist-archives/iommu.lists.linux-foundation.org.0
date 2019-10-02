Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id B9F25C8958
	for <lists.iommu@lfdr.de>; Wed,  2 Oct 2019 15:13:08 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 8851FEB8;
	Wed,  2 Oct 2019 13:13:04 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 51BDAEB4
	for <iommu@lists.linux-foundation.org>;
	Wed,  2 Oct 2019 13:13:03 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 116D01FB
	for <iommu@lists.linux-foundation.org>;
	Wed,  2 Oct 2019 13:13:03 +0000 (UTC)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 03A5421920;
	Wed,  2 Oct 2019 13:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1570021982;
	bh=3e4qjCD59H59r+JQxF+7cnk3Ugzw2q1azgwC+2Vshl0=;
	h=Date:From:To:Cc:Subject:From;
	b=a/Lp9Dn88fyyGRkxwEghkROxDPyppdGB9hjgASPc9EA9nzyvZnjCI4VZ3Dw8i5ybn
	c1Aw85yc4ay9Ncc/TLwJH0nbmFMH33z4g0BVMpMEpmB+AYUbgEO7nIWTcQcAH3vaNW
	lnGJgfDoF6qfGj8305AFPbSPAYwhHDZrpAiKKXFw=
Date: Wed, 2 Oct 2019 14:12:59 +0100
From: Will Deacon <will@kernel.org>
To: joro@8bytes.org
Subject: [GIT PULL] iommu/arm-smmu: Fixes for 5.4-rc2
Message-ID: <20191002131258.ne5r6clp7hq6lxmx@willie-the-truck>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: NeoMutt/20170113 (1.7.2)
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_HI autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: iommu@lists.linux-foundation.org, robin.murphy@arm.com,
	linux-kernel@vger.kernel.org
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

Hi Joerg,

Please can you pull these three arm-smmu fixes for -rc2? They fix a
missing resource free on an error path and some page-table issues with
MALI GPUs including broken cacheability attributes and malformed tree
structure with smaller virtual address ranges.

Thanks,

Will

--->8

The following changes since commit 54ecb8f7028c5eb3d740bb82b0f1d90f2df63c5c:

  Linux 5.4-rc1 (2019-09-30 10:35:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git for-joerg/arm-smmu/fixes

for you to fetch changes up to 1be08f458d1602275b02f5357ef069957058f3fd:

  iommu/io-pgtable-arm: Support all Mali configurations (2019-10-01 12:16:47 +0100)

----------------------------------------------------------------
Liu Xiang (1):
      iommu/arm-smmu: Free context bitmap in the err path of arm_smmu_init_domain_context

Robin Murphy (2):
      iommu/io-pgtable-arm: Correct Mali attributes
      iommu/io-pgtable-arm: Support all Mali configurations

 drivers/iommu/arm-smmu.c       |  1 +
 drivers/iommu/io-pgtable-arm.c | 58 ++++++++++++++++++++++++++++++++----------
 2 files changed, 46 insertions(+), 13 deletions(-)
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
