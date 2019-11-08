Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F63F448B
	for <lists.iommu@lfdr.de>; Fri,  8 Nov 2019 11:33:08 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 87128130F;
	Fri,  8 Nov 2019 10:33:04 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id E53F6AD0
	for <iommu@lists.linux-foundation.org>;
	Fri,  8 Nov 2019 10:33:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 6C6C2EC
	for <iommu@lists.linux-foundation.org>;
	Fri,  8 Nov 2019 10:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573209182;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=GJIemJ28V7SlVdwM6PWNhep+T2p/t4Izn4GDnmEe/tw=;
	b=UcenVrjzlY4xcfplDTmN7ODuVN19AxU1j5VE2fUWjxQ6NsLYvClZjurgVbxjNf2e1uvFoa
	N8ZlV2HtqXN3Xb5bSHK8knHGLWsgBwVh2zsx72FsiC9gnIMzbS6on9UHDDVnJoAr6WMaJ7
	YCRk/qDhG52F6UQW+qpeUHObadf+Cp4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
	[209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-385-aPiaQ9JyNAWA4YQ0AdCh0w-1; Fri, 08 Nov 2019 05:32:58 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4195D800C72;
	Fri,  8 Nov 2019 10:32:56 +0000 (UTC)
Received: from [10.36.116.54] (ovpn-116-54.ams2.redhat.com [10.36.116.54])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4F2931A8D8;
	Fri,  8 Nov 2019 10:32:53 +0000 (UTC)
From: Auger Eric <eric.auger@redhat.com>
Subject: Re: [PATCH v7 01/11] iommu/vt-d: Cache virtual command capability
	register
To: Jacob Pan <jacob.jun.pan@linux.intel.com>,
	iommu@lists.linux-foundation.org, LKML <linux-kernel@vger.kernel.org>, 
	Joerg Roedel <joro@8bytes.org>, David Woodhouse <dwmw2@infradead.org>, 
	Alex Williamson <alex.williamson@redhat.com>,
	Jean-Philippe Brucker <jean-philippe@linaro.com>
References: <1571946904-86776-1-git-send-email-jacob.jun.pan@linux.intel.com>
	<1571946904-86776-2-git-send-email-jacob.jun.pan@linux.intel.com>
Message-ID: <bd0db993-b29d-4a5a-56d4-c2af699eadfd@redhat.com>
Date: Fri, 8 Nov 2019 11:32:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <1571946904-86776-2-git-send-email-jacob.jun.pan@linux.intel.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: aPiaQ9JyNAWA4YQ0AdCh0w-1
X-Mimecast-Spam-Score: 0
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: "Tian, Kevin" <kevin.tian@intel.com>, Raj Ashok <ashok.raj@intel.com>,
	Jonathan Cameron <jic23@kernel.org>
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

Hi Jacob,

On 10/24/19 9:54 PM, Jacob Pan wrote:
> Virtual command registers are used in the guest only, to prevent
> vmexit cost, we cache the capability and store it during initialization.
> 
> Signed-off-by: Jacob Pan <jacob.jun.pan@linux.intel.com>
> ---
>  drivers/iommu/dmar.c        | 1 +
>  include/linux/intel-iommu.h | 4 ++++
>  2 files changed, 5 insertions(+)
> 
> diff --git a/drivers/iommu/dmar.c b/drivers/iommu/dmar.c
> index eecd6a421667..49bb7d76e646 100644
> --- a/drivers/iommu/dmar.c
> +++ b/drivers/iommu/dmar.c
> @@ -950,6 +950,7 @@ static int map_iommu(struct intel_iommu *iommu, u64 phys_addr)
>  		warn_invalid_dmar(phys_addr, " returns all ones");
>  		goto unmap;
>  	}
> +	iommu->vccap = dmar_readq(iommu->reg + DMAR_VCCAP_REG);
>  
>  	/* the registers might be more than one page */
>  	map_size = max_t(int, ecap_max_iotlb_offset(iommu->ecap),
> diff --git a/include/linux/intel-iommu.h b/include/linux/intel-iommu.h
> index ed11ef594378..2e1bed9b7eef 100644
> --- a/include/linux/intel-iommu.h
> +++ b/include/linux/intel-iommu.h
> @@ -186,6 +186,9 @@
>  #define ecap_max_handle_mask(e) ((e >> 20) & 0xf)
>  #define ecap_sc_support(e)	((e >> 7) & 0x1) /* Snooping Control */
>  
> +/* Virtual command interface capabilities */
> +#define vccap_pasid(v)		((v & DMA_VCS_PAS)) /* PASID allocation */
> +
>  /* IOTLB_REG */
>  #define DMA_TLB_FLUSH_GRANU_OFFSET  60
>  #define DMA_TLB_GLOBAL_FLUSH (((u64)1) << 60)
> @@ -520,6 +523,7 @@ struct intel_iommu {
>  	u64		reg_size; /* size of hw register set */
>  	u64		cap;
>  	u64		ecap;
> +	u64		vccap;
>  	u32		gcmd; /* Holds TE, EAFL. Don't need SRTP, SFL, WBF */
>  	raw_spinlock_t	register_lock; /* protect register handling */
>  	int		seq_id;	/* sequence id of the iommu */
> 

with DMA_VCS_PAS's move in this patch as pointed out by Kevin or
vccap_pasid() move to patch 3, feel free to add

Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
