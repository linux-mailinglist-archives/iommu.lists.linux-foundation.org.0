Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B99159ABE
	for <lists.iommu@lfdr.de>; Tue, 11 Feb 2020 21:51:17 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 3922087A04;
	Tue, 11 Feb 2020 20:51:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jQdYdsYk1KPQ; Tue, 11 Feb 2020 20:51:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 2B62387ACE;
	Tue, 11 Feb 2020 20:50:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 09351C1D8E;
	Tue, 11 Feb 2020 20:50:35 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 555FAC07FE
 for <iommu@lists.linux-foundation.org>; Tue, 11 Feb 2020 20:50:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 5053086912
 for <iommu@lists.linux-foundation.org>; Tue, 11 Feb 2020 20:50:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aEaT6HgSaxnP for <iommu@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 20:50:31 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail1.ugh.no (mail1.ugh.no [178.79.162.34])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 444BC86776
 for <iommu@lists.linux-foundation.org>; Tue, 11 Feb 2020 20:50:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail1.ugh.no (Postfix) with ESMTP id 7613D24EA8E;
 Tue, 11 Feb 2020 21:50:28 +0100 (CET)
Received: from mail1.ugh.no ([127.0.0.1])
 by localhost (catastrophix.ugh.no [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UrTvlzb9crBR; Tue, 11 Feb 2020 21:50:28 +0100 (CET)
Received: from [10.255.64.11] (unknown [185.176.245.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: andre@tomt.net)
 by mail.ugh.no (Postfix) with ESMTPSA id 106D924EA6B;
 Tue, 11 Feb 2020 21:50:28 +0100 (CET)
From: Andre Tomt <andre@tomt.net>
Subject: Re: [PATCH v1] xprtrdma: Fix DMA scatter-gather list mapping imbalance
To: Chuck Lever <chuck.lever@oracle.com>
References: <158145102079.515252.3226617475691911684.stgit@morisot.1015granger.net>
Message-ID: <8781b043-74a6-4ee0-d1c9-46f797b4aec2@tomt.net>
Date: Tue, 11 Feb 2020 21:50:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <158145102079.515252.3226617475691911684.stgit@morisot.1015granger.net>
Content-Language: en-US
Cc: linux-nfs@vger.kernel.org, robin.murphy@arm.com,
 iommu@lists.linux-foundation.org
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On 11.02.2020 20:58, Chuck Lever wrote:
> The @nents value that was passed to ib_dma_map_sg() has to be passed
> to the matching ib_dma_unmap_sg() call. If ib_dma_map_sg() choses to
> concatenate sg entries, it will return a different nents value than
> it was passed.
> 
> The bug was exposed by recent changes to the AMD IOMMU driver.

This seems to fail differently on my system; mount fails with:
mount.nfs: mount system call failed

and the kernel log reports:
[   38.890344] NFS: Registering the id_resolver key type
[   38.890351] Key type id_resolver registered
[   38.890352] Key type id_legacy registered
[   38.901799] NFS: nfs4_discover_server_trunking unhandled error -5. 
Exiting with error EIO
[   38.901817] NFS4: Couldn't follow remote path

amd_iommu=off still works

One detail I accidentally left out of the original report is that the 
server (intel system) is running Ubuntu 20.04 ("beta") userspace, and 
AMD clients are Ubuntu 19.10 userspace. Although I dont believe this to 
matter at this point.

> Reported-by: Andre Tomt <andre@tomt.net>
> Suggested-by: Robin Murphy <robin.murphy@arm.com>
> Fixes: 1f541895dae9 ("xprtrdma: Don't defer MR recovery if ro_map fails")
> Signed-off-by: Chuck Lever <chuck.lever@oracle.com>
> ---
>   net/sunrpc/xprtrdma/frwr_ops.c |    5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
> 
> Hey Andre, please try this out. It just reverts the bit of brokenness that
> Robin observed this morning. I've done basic testing here with Intel
> IOMMU systems, no change in behavior (ie, all good to go).
> 
> diff --git a/net/sunrpc/xprtrdma/frwr_ops.c b/net/sunrpc/xprtrdma/frwr_ops.c
> index 095be887753e..449bb51e4fe8 100644
> --- a/net/sunrpc/xprtrdma/frwr_ops.c
> +++ b/net/sunrpc/xprtrdma/frwr_ops.c
> @@ -313,10 +313,9 @@ struct rpcrdma_mr_seg *frwr_map(struct rpcrdma_xprt *r_xprt,
>   			break;
>   	}
>   	mr->mr_dir = rpcrdma_data_dir(writing);
> +	mr->mr_nents = i;
>   
> -	mr->mr_nents =
> -		ib_dma_map_sg(ia->ri_id->device, mr->mr_sg, i, mr->mr_dir);
> -	if (!mr->mr_nents)
> +	if (!ib_dma_map_sg(ia->ri_id->device, mr->mr_sg, i, mr->mr_dir))
>   		goto out_dmamap_err;
>   
>   	ibmr = mr->frwr.fr_mr;
> 
> 

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
