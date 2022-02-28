Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id D0F694C6D26
	for <lists.iommu@lfdr.de>; Mon, 28 Feb 2022 13:49:20 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8BAB960A80;
	Mon, 28 Feb 2022 12:49:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tq1yhDXhE9IO; Mon, 28 Feb 2022 12:49:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 9E9B660ACD;
	Mon, 28 Feb 2022 12:49:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8705EC001A;
	Mon, 28 Feb 2022 12:49:18 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 546B0C001A
 for <iommu@lists.linux-foundation.org>; Mon, 28 Feb 2022 12:49:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3461460ACD
 for <iommu@lists.linux-foundation.org>; Mon, 28 Feb 2022 12:49:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id joawSSq4_5kA for <iommu@lists.linux-foundation.org>;
 Mon, 28 Feb 2022 12:49:16 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from theia.8bytes.org (8bytes.org
 [IPv6:2a01:238:4383:600:38bc:a715:4b6d:a889])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5CA3960A80
 for <iommu@lists.linux-foundation.org>; Mon, 28 Feb 2022 12:49:16 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 819304B0; Mon, 28 Feb 2022 13:49:14 +0100 (CET)
Date: Mon, 28 Feb 2022 13:49:13 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Lu Baolu <baolu.lu@linux.intel.com>
Subject: Re: [PATCH 1/1] iommu/vt-d: Fix double list_add when enabling VMD in
 scalable mode
Message-ID: <YhzEyfJ2Fa5Ikn+x@8bytes.org>
References: <20220221053348.262724-1-baolu.lu@linux.intel.com>
 <20220221053348.262724-2-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220221053348.262724-2-baolu.lu@linux.intel.com>
Cc: iommu@lists.linux-foundation.org, Adrian Huang <ahuang12@lenovo.com>,
 stable@vger.kernel.org
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

On Mon, Feb 21, 2022 at 01:33:48PM +0800, Lu Baolu wrote:
> Fixes: 474dd1c65064 ("iommu/vt-d: Fix clearing real DMA device's scalable-mode context entries")
> Cc: stable@vger.kernel.org # v5.14+
> Signed-off-by: Adrian Huang <ahuang12@lenovo.com>
> Link: https://lore.kernel.org/r/20220216091307.703-1-adrianhuang0701@gmail.com
> Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
> ---
>  drivers/iommu/intel/iommu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied for v5.17, thanks.

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
