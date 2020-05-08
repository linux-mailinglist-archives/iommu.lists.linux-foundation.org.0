Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id D3E3D1CB2DF
	for <lists.iommu@lfdr.de>; Fri,  8 May 2020 17:32:00 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 72F4D8870F;
	Fri,  8 May 2020 15:31:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1NUv-BOORkkp; Fri,  8 May 2020 15:31:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 38ABA88702;
	Fri,  8 May 2020 15:31:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0E82FC07FF;
	Fri,  8 May 2020 15:31:58 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 62468C07FF;
 Fri,  8 May 2020 15:31:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 49EDA88702;
 Fri,  8 May 2020 15:31:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cRM4LpXc7+FX; Fri,  8 May 2020 15:31:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by whitealder.osuosl.org (Postfix) with ESMTPS id DC61A88704;
 Fri,  8 May 2020 15:31:54 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 8B21C423; Fri,  8 May 2020 17:31:51 +0200 (CEST)
Date: Fri, 8 May 2020 17:31:49 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Julia Lawall <Julia.Lawall@inria.fr>
Subject: Re: [PATCH] iommu/virtio: reverse arguments to list_add
Message-ID: <20200508153149.GA10908@8bytes.org>
References: <1588704467-13431-1-git-send-email-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1588704467-13431-1-git-send-email-Julia.Lawall@inria.fr>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: eugene.volanschi@inria.fr, Jean-Philippe Brucker <jean-philippe@linaro.org>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, iommu@lists.linux-foundation.org
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

On Tue, May 05, 2020 at 08:47:47PM +0200, Julia Lawall wrote:
> Elsewhere in the file, there is a list_for_each_entry with
> &vdev->resv_regions as the second argument, suggesting that
> &vdev->resv_regions is the list head.  So exchange the
> arguments on the list_add call to put the list head in the
> second argument.
> 
> Fixes: 2a5a31487445 ("iommu/virtio: Add probe request")
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

Applied for v5.7, thanks.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
