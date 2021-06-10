Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id B0D553A2520
	for <lists.iommu@lfdr.de>; Thu, 10 Jun 2021 09:14:04 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2E676607A9;
	Thu, 10 Jun 2021 07:14:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1TDAoCtMnf79; Thu, 10 Jun 2021 07:14:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 559DD60719;
	Thu, 10 Jun 2021 07:14:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 123EFC000B;
	Thu, 10 Jun 2021 07:14:02 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9870AC000B
 for <iommu@lists.linux-foundation.org>; Thu, 10 Jun 2021 07:14:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7E2C560719
 for <iommu@lists.linux-foundation.org>; Thu, 10 Jun 2021 07:14:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g6axCx5RNoRN for <iommu@lists.linux-foundation.org>;
 Thu, 10 Jun 2021 07:13:59 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from theia.8bytes.org (8bytes.org
 [IPv6:2a01:238:4383:600:38bc:a715:4b6d:a889])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 555E960624
 for <iommu@lists.linux-foundation.org>; Thu, 10 Jun 2021 07:13:59 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id E602F2FB; Thu, 10 Jun 2021 09:13:55 +0200 (CEST)
Date: Thu, 10 Jun 2021 09:13:52 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Lu Baolu <baolu.lu@linux.intel.com>
Subject: Re: [PATCH 00/23] [PULL REQUEST] Intel IOMMU Updates for Linux v5.14
Message-ID: <YMG7sPHG0ibZVXtp@8bytes.org>
References: <20210610020115.1637656-1-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210610020115.1637656-1-baolu.lu@linux.intel.com>
Cc: Fenghua Yu <fenghua.yu@intel.com>, Ashok Raj <ashok.raj@intel.com>,
 Aditya Srivastava <yashsri421@gmail.com>, Randy Dunlap <rdunlap@infradead.org>,
 YueHaibing <yuehaibing@huawei.com>,
 "Gustavo A . R . Silva" <gustavoars@kernel.org>,
 iommu@lists.linux-foundation.org, Colin Ian King <colin.king@canonical.com>,
 Will Deacon <will@kernel.org>
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

On Thu, Jun 10, 2021 at 10:00:52AM +0800, Lu Baolu wrote:
>  include/linux/intel-iommu.h        |  44 +-
>  drivers/iommu/intel/perf.h         |  73 ++++
>  include/trace/events/intel_iommu.h |  37 ++
>  drivers/iommu/intel/debugfs.c      | 111 +++++
>  drivers/iommu/intel/dmar.c         |  54 ++-
>  drivers/iommu/intel/iommu.c        | 163 +++++---
>  drivers/iommu/intel/pasid.c        |   2 +-
>  drivers/iommu/intel/perf.c         | 166 ++++++++
>  drivers/iommu/intel/svm.c          | 643 ++++++++++++++---------------
>  drivers/iommu/intel/Kconfig        |   6 +
>  drivers/iommu/intel/Makefile       |   1 +
>  11 files changed, 894 insertions(+), 406 deletions(-)
>  create mode 100644 drivers/iommu/intel/perf.h
>  create mode 100644 drivers/iommu/intel/perf.c

Applied, thanks Baolu.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
