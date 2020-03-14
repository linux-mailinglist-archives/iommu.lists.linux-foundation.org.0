Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C336185639
	for <lists.iommu@lfdr.de>; Sat, 14 Mar 2020 20:03:14 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 9B71A207EF;
	Sat, 14 Mar 2020 19:03:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eP3C8L6W7Oz3; Sat, 14 Mar 2020 19:03:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id CC453259C9;
	Sat, 14 Mar 2020 19:03:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B2F2AC0177;
	Sat, 14 Mar 2020 19:03:11 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B0852C0177
 for <iommu@lists.linux-foundation.org>; Sat, 14 Mar 2020 19:03:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id A6B8422DEC
 for <iommu@lists.linux-foundation.org>; Sat, 14 Mar 2020 19:03:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r9qCuS0RZILr for <iommu@lists.linux-foundation.org>;
 Sat, 14 Mar 2020 19:03:09 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by silver.osuosl.org (Postfix) with ESMTPS id DAF05207EF
 for <iommu@lists.linux-foundation.org>; Sat, 14 Mar 2020 19:03:08 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 9492235A; Sat, 14 Mar 2020 20:03:04 +0100 (CET)
Date: Sat, 14 Mar 2020 20:03:01 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Lu Baolu <baolu.lu@linux.intel.com>
Subject: Re: [PATCH v2 1/1] iommu/vt-d: Populate debugfs if IOMMUs are detected
Message-ID: <20200314190301.GR3794@8bytes.org>
References: <20200314033959.21904-1-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200314033959.21904-1-baolu.lu@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: iommu@lists.linux-foundation.org, Megha Dey <megha.dey@linux.intel.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
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

On Sat, Mar 14, 2020 at 11:39:59AM +0800, Lu Baolu wrote:
> From: Megha Dey <megha.dey@linux.intel.com>
> 
> Currently, the intel iommu debugfs directory(/sys/kernel/debug/iommu/intel)
> gets populated only when DMA remapping is enabled (dmar_disabled = 0)
> irrespective of whether interrupt remapping is enabled or not.
> 
> Instead, populate the intel iommu debugfs directory if any IOMMUs are
> detected.
> 
> Cc: Dan Carpenter <dan.carpenter@oracle.com>
> Fixes: ee2636b8670b1 ("iommu/vt-d: Enable base Intel IOMMU debugfs support")
> Signed-off-by: Megha Dey <megha.dey@linux.intel.com>
> Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
> ---
>  drivers/iommu/intel-iommu-debugfs.c | 11 ++++++++++-
>  drivers/iommu/intel-iommu.c         |  4 +++-
>  2 files changed, 13 insertions(+), 2 deletions(-)

Applied, thanks.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
