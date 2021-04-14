Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 126D435F7C8
	for <lists.iommu@lfdr.de>; Wed, 14 Apr 2021 17:45:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1E06D4017E;
	Wed, 14 Apr 2021 15:45:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fzPNDro-0S57; Wed, 14 Apr 2021 15:45:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3FE6B4013A;
	Wed, 14 Apr 2021 15:45:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1D666C0012;
	Wed, 14 Apr 2021 15:45:57 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6B1E2C000A
 for <iommu@lists.linux-foundation.org>; Wed, 14 Apr 2021 15:45:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 46EE4400D2
 for <iommu@lists.linux-foundation.org>; Wed, 14 Apr 2021 15:45:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W0vxAW1dLX05 for <iommu@lists.linux-foundation.org>;
 Wed, 14 Apr 2021 15:45:54 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B61734017E
 for <iommu@lists.linux-foundation.org>; Wed, 14 Apr 2021 15:45:54 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6B73761164;
 Wed, 14 Apr 2021 15:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1618415154;
 bh=hfUH+l4yceoC3AqTD4Kdw7lyf+fTM5LhOB+L96OLehc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=0tjSNZK6avIABrfXwQbVKug5rACXB5oWomA2ezly6jw95g6/7PUCtVF1oFXJ5wVHE
 FcBEykVjCai8T/rSms3YMehK5wMagFIRVK/CLORkifh3WpNOfF3hyOve3c38SON951
 OhI8K1OOAlcNulMnOPPJBC9QO9eAi8eEwbOuV7Q8=
Date: Wed, 14 Apr 2021 17:45:51 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Tianyu Lan <ltykernel@gmail.com>
Subject: Re: [Resend RFC PATCH V2 08/12] UIO/Hyper-V: Not load UIO HV driver
 in the isolation VM.
Message-ID: <YHcOL+HlEoh5jPb8@kroah.com>
References: <20210414144945.3460554-1-ltykernel@gmail.com>
 <20210414144945.3460554-9-ltykernel@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210414144945.3460554-9-ltykernel@gmail.com>
Cc: linux-hyperv@vger.kernel.org, brijesh.singh@amd.com, linux-mm@kvack.org,
 hpa@zytor.com, kys@microsoft.com, will@kernel.org, hch@lst.de,
 linux-arch@vger.kernel.org, wei.liu@kernel.org, sthemmin@microsoft.com,
 linux-scsi@vger.kernel.org, x86@kernel.org, mingo@redhat.com, kuba@kernel.org,
 jejb@linux.ibm.com, thomas.lendacky@amd.com,
 Tianyu Lan <Tianyu.Lan@microsoft.com>, arnd@arndb.de, konrad.wilk@oracle.com,
 haiyangz@microsoft.com, bp@alien8.de, tglx@linutronix.de, vkuznets@redhat.com,
 martin.petersen@oracle.com, netdev@vger.kernel.org, sunilmut@microsoft.com,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 akpm@linux-foundation.org, robin.murphy@arm.com, davem@davemloft.net
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

On Wed, Apr 14, 2021 at 10:49:41AM -0400, Tianyu Lan wrote:
> From: Tianyu Lan <Tianyu.Lan@microsoft.com>
> 
> UIO HV driver should not load in the isolation VM for security reason.
> Return ENOTSUPP in the hv_uio_probe() in the isolation VM.
> 
> Signed-off-by: Tianyu Lan <Tianyu.Lan@microsoft.com>
> ---
>  drivers/uio/uio_hv_generic.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/uio/uio_hv_generic.c b/drivers/uio/uio_hv_generic.c
> index 0330ba99730e..678b021d66f8 100644
> --- a/drivers/uio/uio_hv_generic.c
> +++ b/drivers/uio/uio_hv_generic.c
> @@ -29,6 +29,7 @@
>  #include <linux/hyperv.h>
>  #include <linux/vmalloc.h>
>  #include <linux/slab.h>
> +#include <asm/mshyperv.h>
>  
>  #include "../hv/hyperv_vmbus.h"
>  
> @@ -241,6 +242,10 @@ hv_uio_probe(struct hv_device *dev,
>  	void *ring_buffer;
>  	int ret;
>  
> +	/* UIO driver should not be loaded in the isolation VM.*/
> +	if (hv_is_isolation_supported())
> +		return -ENOTSUPP;
> +		
>  	/* Communicating with host has to be via shared memory not hypercall */
>  	if (!channel->offermsg.monitor_allocated) {
>  		dev_err(&dev->device, "vmbus channel requires hypercall\n");
> -- 
> 2.25.1
> 

Again you send out known-wrong patches?

:(
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
