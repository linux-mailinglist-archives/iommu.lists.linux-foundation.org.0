Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 4886C12DED6
	for <lists.iommu@lfdr.de>; Wed,  1 Jan 2020 12:45:10 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id E6D7987B94;
	Wed,  1 Jan 2020 11:45:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3fu71lvfB9cS; Wed,  1 Jan 2020 11:45:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id BDA5F87ADF;
	Wed,  1 Jan 2020 11:45:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AB1E8C077D;
	Wed,  1 Jan 2020 11:45:06 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E36DEC077D
 for <iommu@lists.linux-foundation.org>; Wed,  1 Jan 2020 11:45:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id DA3DD20471
 for <iommu@lists.linux-foundation.org>; Wed,  1 Jan 2020 11:45:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vCzF9fJhi-lN for <iommu@lists.linux-foundation.org>;
 Wed,  1 Jan 2020 11:45:02 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [85.215.255.52])
 by silver.osuosl.org (Postfix) with ESMTPS id 2921020439
 for <iommu@lists.linux-foundation.org>; Wed,  1 Jan 2020 11:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1577879099;
 s=strato-dkim-0002; d=gerhold.net;
 h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=+8cBDrHT6W1avfbXZsd7kRnygjsSHUUDOoSidqyDUbM=;
 b=kmQ02ARSiqanx4I0LaUiwb6d70N3mNWjnFghlSslZJEtQHFlOIIaaqkzi2FN9IldCQ
 8Z5lSoGf0Et6YP03VaVi1hpTj7huSbTi26LV3727FBop9luh/uTPnW5Nw7X7oC2ATcmt
 fzjJ42s7BC6TztWdtVC4kqDD2ctglHgf6cG+MIkhYMsSj/VUJQGy1Mad+MtKkYG4mf5+
 PGhEPw+a4+gq0JBz4sHc6Zf7Jexsm1DEBdyT/2NHCOswK7G9mQKBCQMyb3a8+ryF2Ryf
 RfvVmxL+yGFygGbNFpOGy3QruIbdNI4ip4QxoKhBkTEzSXNP9/E8s7jKcaYF4h+RehTc
 gVEg==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u266EZF6ORJDdPLYs76f"
X-RZG-CLASS-ID: mo00
Received: from gerhold.net by smtp.strato.de (RZmta 46.1.3 AUTH)
 with ESMTPSA id z012abw01BioTJT
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 1 Jan 2020 12:44:50 +0100 (CET)
Date: Wed, 1 Jan 2020 12:44:48 +0100
From: Stephan Gerhold <stephan@gerhold.net>
To: Brian Masney <masneyb@onstation.org>
Subject: Re: [PATCH] iommu/qcom: fix NULL pointer dereference during probe
 deferral
Message-ID: <20200101114448.GB67534@gerhold.net>
References: <20200101033949.755-1-masneyb@onstation.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200101033949.755-1-masneyb@onstation.org>
Cc: linux-arm-msm@vger.kernel.org, iommu@lists.linux-foundation.org,
 bjorn.andersson@linaro.org, agross@kernel.org, linux-kernel@vger.kernel.org
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

On Tue, Dec 31, 2019 at 10:39:49PM -0500, Brian Masney wrote:
> When attempting to load the qcom-iommu driver, and an -EPROBE_DEFER
> error occurs, the following attempted NULL pointer deference occurs:
> 
>     Unable to handle kernel NULL pointer dereference at virtual address 00000014
>     pgd = (ptrval)
>     [00000014] *pgd=00000000
>     Internal error: Oops: 5 [#1] PREEMPT SMP ARM
>     Modules linked in:
>     CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.5.0-rc2-next-20191220-00008-g7e71398bac41-dirty #67
>     Hardware name: Generic DT based system
>     PC is at qcom_iommu_domain_free (./include/linux/pm_runtime.h:226
>       linux/drivers/iommu/qcom_iommu.c:358)
>     LR is at release_iommu_mapping (arch/arm/mm/dma-mapping.c:2141)
>     pc : lr : psr: 60000013
>     sp : ee89dc48  ip : 00000000  fp : c13a6684
>     r10: c13a661c  r9 : 00000000  r8 : c13a1240
>     r7 : fffffdfb  r6 : 00000000  r5 : edc32c80  r4 : edc32c9c
>     r3 : 00000000  r2 : 00000001  r1 : 00000004  r0 : edc32c9c
>     Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment none
>     Control: 10c5787d  Table: 0020406a  DAC: 00000051
>     Process swapper/0 (pid: 1, stack limit = 0x(ptrval))
>     Stack: (0xee89dc48 to 0xee89e000)
>     dc40:                   edc3cc10 edc31ba0 00000000 c0316af8 edc3cc10 edc31b80
>     dc60: 00000000 c0319684 c14341ac edc3cc10 00000000 c083bd88 edc3cc10 c13a1240
>     dc80: c083c2e8 c13a6684 c13a661c c13a6508 c13a661c c083c134 c13a1240 ee89dcec
>     dca0: edc3cc10 00000000 ee89dcec c083c2e8 c13a6684 c13a661c c13a6508 c13a661c
>     dcc0: c13a6684 c083a31c c13a6684 ee82a86c edc32538 c1304e48 edc3cc10 00000001
>     dce0: edc3cc54 c083bc08 ee82a880 edc3cc10 00000001 c1304e48 edc3cc10 edc3cc10
>     dd00: c13a69e8 c083b010 edc3cc10 00000000 eea1fc10 c0837aac 00000200 00000000
>     dd20: 00000000 00000000 00000000 c1304e48 00000000 edc3cc00 eea1fc10 00000000
>     dd40: 00000000 eeff42f4 00000000 00000001 00000000 c09e96e0 eeff42a4 00000000
>     dd60: 00000000 00000000 eea1fc10 c09e98bc 00000001 eea1fc10 00000000 eea1fc10
>     dd80: edc32980 c1391580 eea1fc10 00000001 eea1fc10 c0850f90 c2706d80 c14368c0
>     dda0: 60000013 c1304e48 00000106 eeff42a4 eeff3fa0 00000000 00000000 eea1fc10
>     ddc0: 00000001 c1248900 00000106 c09e9bd0 00000001 c0c2ee64 eea1fc00 eea1fc10
>     dde0: eea1fc10 00000000 c13a5b70 00000000 c1248900 c081496c c1023d84 00000000
>     de00: eeff3fa0 c2706ddc c2706ddc c1304e48 00000001 00000000 eea1fc10 c13a5b70
>     de20: 00000000 c13a5b70 00000000 c1248900 00000106 c083dfb8 c14341ac eea1fc10
>     de40: 00000000 c083be58 eea1fc10 c13a5b70 c13a5b70 c13a69e8 c12003ec c123a854
>     de60: c1248900 c083c134 c1248900 c09e6f3c c0d8d514 eea1fc10 00000000 c13a5b70
>     de80: c13a69e8 c12003ec c123a854 c1248900 00000106 c083c3e0 00000000 c13a5b70
>     dea0: eea1fc10 c083c440 00000000 c13a5b70 c083c3e8 c083a23c 00000106 ee82a858
>     dec0: eea052b4 c1304e48 c13a5b70 edc32900 00000000 c083b270 c1043084 c121d1d8
>     dee0: ffffe000 c13a5b70 c121d1d8 ffffe000 00000000 c083cfcc c13ece60 c121d1d8
>     df00: ffffe000 c0302f90 00000106 c034407c 00000000 c10e3a00 c1044dd0 c12003ec
>     df20: 00000000 00000006 00000006 c0fbecac c0fada88 c0fada3c 00000000 efffcbf8
>     df40: efffcc0d c1304e48 00000000 00000006 c13f9500 c1304e48 c123a830 00000007
>     df60: c13f9500 c13f9500 c123a834 c1200f64 00000006 00000006 00000000 c12003ec
>     df80: c0c28194 00000000 c0c28194 00000000 00000000 00000000 00000000 00000000
>     dfa0: 00000000 c0c2819c 00000000 c03010e8 00000000 00000000 00000000 00000000
>     dfc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
>     dfe0: 00000000 00000000 00000000 00000000 00000013 00000000 00000000 00000000
>     (qcom_iommu_domain_free) from release_iommu_mapping (arch/arm/mm/dma-mapping.c:2141)
>     (release_iommu_mapping) from arch_teardown_dma_ops (./include/linux/dma-mapping.h:271
>       linux/arch/arm/mm/dma-mapping.c:2335)
>     (arch_teardown_dma_ops) from really_probe (drivers/base/dd.c:607)
>     (really_probe) from driver_probe_device (drivers/base/dd.c:721)
>     (driver_probe_device) from bus_for_each_drv (drivers/base/bus.c:431)
>     (bus_for_each_drv) from __device_attach (drivers/base/dd.c:896)
>     (__device_attach) from bus_probe_device (drivers/base/bus.c:491)
>     (bus_probe_device) from device_add (drivers/base/core.c:2488)
>     (device_add) from of_platform_device_create_pdata (drivers/of/platform.c:189)
>     (of_platform_device_create_pdata) from of_platform_bus_create
>       (drivers/of/platform.c:393 linux/drivers/of/platform.c:346)
>     (of_platform_bus_create) from of_platform_populate (drivers/of/platform.c:486)
>     (of_platform_populate) from msm_pdev_probe (drivers/gpu/drm/msm/msm_drv.c:1197
>       linux/drivers/gpu/drm/msm/msm_drv.c:1281)
>     (msm_pdev_probe) from platform_drv_probe (drivers/base/platform.c:726)
>     (platform_drv_probe) from really_probe (drivers/base/dd.c:553)
>     (really_probe) from driver_probe_device (drivers/base/dd.c:721)
>     (driver_probe_device) from device_driver_attach (drivers/base/dd.c:995)
>     (device_driver_attach) from __driver_attach (drivers/base/dd.c:1074)
>     (__driver_attach) from bus_for_each_dev (drivers/base/bus.c:304)
>     (bus_for_each_dev) from bus_add_driver (drivers/base/bus.c:623)
>     (bus_add_driver) from driver_register (drivers/base/driver.c:172)
>     (driver_register) from do_one_initcall (./include/linux/compiler.h:232
>       linux/./include/linux/jump_label.h:254
>       linux/./include/linux/jump_label.h:264
>       linux/./include/trace/events/initcall.h:48 linux/init/main.c:941)
>     (do_one_initcall) from kernel_init_freeable (init/main.c:1013
>       linux/init/main.c:1022 linux/init/main.c:1039
>       linux/init/main.c:1231)
>     (kernel_init_freeable) from kernel_init (init/main.c:1127)
>     (kernel_init) from ret_from_fork (arch/arm/kernel/entry-common.S:156)
>     Exception stack(0xee89dfb0 to 0xee89dff8)
>     dfa0:                                     00000000 00000000 00000000 00000000
>     dfc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
>     dfe0: 00000000 00000000 00000000 00000000 00000013 00000000
>     Code: e92d4070 e1a04000 e3a01004 e240501c (e5930014)
>     All code
>     ========
>        0:	70 40                	jo     0x42
>        2:	2d e9 00 40 a0       	sub    $0xa04000e9,%eax
>        7:	e1 04                	loope  0xd
>        9:	10 a0 e3 1c 50 40    	adc    %ah,0x40501ce3(%rax)
>        f:	e2 14                	loop   0x25
>       11:*	00                   	.byte 0x0		<-- trapping instruction
>       12:	93                   	xchg   %eax,%ebx
>       13:	e5                   	.byte 0xe5
> 
>     Code starting with the faulting instruction
>     ===========================================
>        0:	14 00                	adc    $0x0,%al
>        2:	93                   	xchg   %eax,%ebx
>        3:	e5                   	.byte 0xe5
> 
> qcom_iommu_domain_free() has a WARN_ON() that checks to see if the value
> of iommu is NULL and returns early, so iommu->dev will always be NULL.
> qcom_iommu_detach_dev() is called prior to freeing the IOMMU domain and
> is what sets the iommu member to NULL.
> 
> Let's fix this by adding the 'struct dev' pointer to the
> qcom_iommu_domain struct.
> 
> Signed-off-by: Brian Masney <masneyb@onstation.org>
> Fixes: 0ae349a0f33fb ("iommu/qcom: Add qcom_iommu")

Thanks for the patch!

This problem has been annoying me for quite a while.
Recently I was debugging some IOMMU issues and this crash
literally happened whenever there was something wrong during
IOMMU initialization. :)

I was not quite sure how to fix it, but this patch seems to work fine.

FWIW:
Tested-by: Stephan Gerhold <stephan@gerhold.net>

> ---
>  drivers/iommu/qcom_iommu.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iommu/qcom_iommu.c b/drivers/iommu/qcom_iommu.c
> index 52f38292df5b..ac4354773c06 100644
> --- a/drivers/iommu/qcom_iommu.c
> +++ b/drivers/iommu/qcom_iommu.c
> @@ -65,6 +65,7 @@ struct qcom_iommu_domain {
>  	struct mutex		 init_mutex; /* Protects iommu pointer */
>  	struct iommu_domain	 domain;
>  	struct qcom_iommu_dev	*iommu;
> +	struct device		*dev;
>  };
>  
>  static struct qcom_iommu_domain *to_qcom_iommu_domain(struct iommu_domain *dom)
> @@ -243,6 +244,13 @@ static int qcom_iommu_init_domain(struct iommu_domain *domain,
>  	};
>  
>  	qcom_domain->iommu = qcom_iommu;
> +
> +	/*
> +	 * This dev pointer is needed to avoid a NULL pointer dereference in
> +	 * qcom_iommu_domain_free().
> +	 */
> +	qcom_domain->dev = qcom_iommu->dev;
> +
>  	pgtbl_ops = alloc_io_pgtable_ops(ARM_32_LPAE_S1, &pgtbl_cfg, fwspec);
>  	if (!pgtbl_ops) {
>  		dev_err(qcom_iommu->dev, "failed to allocate pagetable ops\n");
> @@ -355,11 +363,11 @@ static void qcom_iommu_domain_free(struct iommu_domain *domain)
>  	 * cannot rely on the device_link.  Make sure the IOMMU is on to
>  	 * avoid unclocked accesses in the TLB inv path:
>  	 */
> -	pm_runtime_get_sync(qcom_domain->iommu->dev);
> +	pm_runtime_get_sync(qcom_domain->dev);
>  
>  	free_io_pgtable_ops(qcom_domain->pgtbl_ops);
>  
> -	pm_runtime_put_sync(qcom_domain->iommu->dev);
> +	pm_runtime_put_sync(qcom_domain->dev);
>  
>  	kfree(qcom_domain);
>  }
> -- 
> 2.21.0
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
