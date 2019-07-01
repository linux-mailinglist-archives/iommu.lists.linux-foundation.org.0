Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C45442F6F
	for <lists.iommu@lfdr.de>; Wed, 12 Jun 2019 21:01:42 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id EF46322E2;
	Wed, 12 Jun 2019 19:01:40 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 69772220C
	for <iommu@lists.linux-foundation.org>;
	Wed, 12 Jun 2019 18:59:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id F1470E6
	for <iommu@lists.linux-foundation.org>;
	Wed, 12 Jun 2019 18:59:00 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Jun 2019 11:59:00 -0700
X-ExtLoop1: 1
Received: from jacob-builder.jf.intel.com (HELO jacob-builder) ([10.7.199.155])
	by orsmga004.jf.intel.com with ESMTP; 12 Jun 2019 11:59:00 -0700
Date: Wed, 12 Jun 2019 12:02:09 -0700
From: Jacob Pan <jacob.jun.pan@linux.intel.com>
To: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
Subject: Re: [PATCH] iommu: Add padding to struct iommu_fault
Message-ID: <20190612120209.29e90efe@jacob-builder>
In-Reply-To: <20190612175938.16428-1-jean-philippe.brucker@arm.com>
References: <20190612131143.GF21613@8bytes.org>
	<20190612175938.16428-1-jean-philippe.brucker@arm.com>
Organization: OTC
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: iommu@lists.linux-foundation.org
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

On Wed, 12 Jun 2019 18:59:38 +0100
Jean-Philippe Brucker <jean-philippe.brucker@arm.com> wrote:

> Ease future extensions of struct iommu_fault_page_request and struct
> iommu_fault_unrecoverable by adding a few bytes of padding. That way,
> a new field can be added to either of these structures by simply
> introducing a new flag. To extend it after the size limit is reached,
> a new fault reporting structure will have to be negotiated with
> userspace.
> 
> With 56 bytes of padding, the total size of iommu_fault is 64 bytes
> and fits in a cache line on a lot of contemporary machines, while
> providing 16 and 24 bytes of extension to structures
> iommu_fault_page_request and iommu_fault_unrecoverable respectively.
> 
> Signed-off-by: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
> ---
>  include/uapi/linux/iommu.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/include/uapi/linux/iommu.h b/include/uapi/linux/iommu.h
> index f45d8e9e59c3..fc00c5d4741b 100644
> --- a/include/uapi/linux/iommu.h
> +++ b/include/uapi/linux/iommu.h
> @@ -105,15 +105,17 @@ struct iommu_fault_page_request {
>   * @type: fault type from &enum iommu_fault_type
>   * @padding: reserved for future use (should be zero)
>   * @event: fault event, when @type is %IOMMU_FAULT_DMA_UNRECOV
>   * @prm: Page Request message, when @type is %IOMMU_FAULT_PAGE_REQ
> + * @padding2: sets the fault size to allow for future extensions
>   */
>  struct iommu_fault {
>  	__u32	type;
>  	__u32	padding;
>  	union {
>  		struct iommu_fault_unrecoverable event;
>  		struct iommu_fault_page_request prm;
> +		__u8 padding2[56];
>  	};
>  };
>  

Acked-by: Jacob Pan <jacob.jun.pan@linux.intel.com>

>  /**

[Jacob Pan]
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
