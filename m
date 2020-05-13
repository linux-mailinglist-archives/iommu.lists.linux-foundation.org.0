Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id A96581D0B08
	for <lists.iommu@lfdr.de>; Wed, 13 May 2020 10:42:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 5296887FE3;
	Wed, 13 May 2020 08:42:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qzYVxqN28vd2; Wed, 13 May 2020 08:42:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 93DA9881C4;
	Wed, 13 May 2020 08:42:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7699BC0893;
	Wed, 13 May 2020 08:42:56 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E85AEC016F
 for <iommu@lists.linux-foundation.org>; Wed, 13 May 2020 08:42:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id CF6F186978
 for <iommu@lists.linux-foundation.org>; Wed, 13 May 2020 08:42:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O9hZCP-4j4lZ for <iommu@lists.linux-foundation.org>;
 Wed, 13 May 2020 08:42:53 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 7CB7D8692B
 for <iommu@lists.linux-foundation.org>; Wed, 13 May 2020 08:42:53 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 092FF379; Wed, 13 May 2020 10:42:51 +0200 (CEST)
Date: Wed, 13 May 2020 10:42:50 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] iommu: Do not probe devices on IOMMU-less busses
Message-ID: <20200513084250.GC9820@8bytes.org>
References: <20200511161000.3853342-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200511161000.3853342-1-thierry.reding@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
 Jon Hunter <jonathanh@nvidia.com>
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

On Mon, May 11, 2020 at 06:10:00PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> The host1x bus implemented on Tegra SoCs is primarily an abstraction to
> create logical device from multiple platform devices. Since the devices
> in such a setup are typically hierarchical, DMA setup still needs to be
> done so that DMA masks can be properly inherited, but we don't actually
> want to attach the host1x logical devices to any IOMMU. The platform
> devices that make up the logical device are responsible for memory bus
> transactions, so it is them that will need to be attached to the IOMMU.
> 
> Add a check to __iommu_probe_device() that aborts IOMMU setup early for
> busses that don't have the IOMMU operations pointer set since they will
> cause a crash otherwise.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
> Note that this is probably also required for the BCMA bus implemented in
> drivers/bcma/main.c since no IOMMU operations are ever assigned to that
> either.
> 
>  drivers/iommu/iommu.c | 3 +++
>  1 file changed, 3 insertions(+)

Applied, thanks.

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
