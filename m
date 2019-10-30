Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A6FDEA444
	for <lists.iommu@lfdr.de>; Wed, 30 Oct 2019 20:31:57 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id CCCE4E7B;
	Wed, 30 Oct 2019 19:31:53 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id D0647E7B
	for <iommu@lists.linux-foundation.org>;
	Wed, 30 Oct 2019 19:31:52 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id F13BD174
	for <iommu@lists.linux-foundation.org>;
	Wed, 30 Oct 2019 19:31:51 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
	id 0CD73148; Wed, 30 Oct 2019 20:31:48 +0100 (CET)
Date: Wed, 30 Oct 2019 20:31:48 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Will Deacon <will@kernel.org>
Subject: Re: [PATCH 5/7] iommu/arm-smmu-v3: Allow building as a module
Message-ID: <20191030193148.GA8432@8bytes.org>
References: <20191030145112.19738-1-will@kernel.org>
	<20191030145112.19738-6-will@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191030145112.19738-6-will@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Spam-Status: No, score=0.8 required=5.0 tests=BAYES_00, DOS_RCVD_IP_TWICE_B, 
	RCVD_IN_DNSWL_NONE autolearn=no version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Bjorn Helgaas <bhelgaas@google.com>, iommu@lists.linux-foundation.org,
	Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org
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

Hi Will,

On Wed, Oct 30, 2019 at 02:51:10PM +0000, Will Deacon wrote:
> By removing the redundant call to 'pci_request_acs()' we can allow the
> ARM SMMUv3 driver to be built as a module.
> 
> Signed-off-by: Will Deacon <will@kernel.org>
> ---
>  drivers/iommu/Kconfig       | 2 +-
>  drivers/iommu/arm-smmu-v3.c | 1 -
>  2 files changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
> index e3842eabcfdd..7583d47fc4d5 100644
> --- a/drivers/iommu/Kconfig
> +++ b/drivers/iommu/Kconfig
> @@ -388,7 +388,7 @@ config ARM_SMMU_DISABLE_BYPASS_BY_DEFAULT
>  	  config.
>  
>  config ARM_SMMU_V3
> -	bool "ARM Ltd. System MMU Version 3 (SMMUv3) Support"
> +	tristate "ARM Ltd. System MMU Version 3 (SMMUv3) Support"
>  	depends on ARM64
>  	select IOMMU_API
>  	select IOMMU_IO_PGTABLE_LPAEa

Sorry for the stupid question, but what prevents the iommu module from
being unloaded when there are active users? There are no symbol
dependencies to endpoint device drivers, because the interface is only
exposed through the iommu-api, right? Is some sort of manual module
reference counting needed?


	Joerg

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
