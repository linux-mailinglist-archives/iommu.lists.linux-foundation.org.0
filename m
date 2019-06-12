Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id BC16C42FD6
	for <lists.iommu@lfdr.de>; Wed, 12 Jun 2019 21:21:37 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 2693122FF;
	Wed, 12 Jun 2019 19:21:36 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id C016922E9
	for <iommu@lists.linux-foundation.org>;
	Wed, 12 Jun 2019 19:19:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 462F0E6
	for <iommu@lists.linux-foundation.org>;
	Wed, 12 Jun 2019 19:19:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B7C172F8BF0;
	Wed, 12 Jun 2019 19:19:43 +0000 (UTC)
Received: from [10.36.116.67] (ovpn-116-67.ams2.redhat.com [10.36.116.67])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 895BC183CD;
	Wed, 12 Jun 2019 19:19:40 +0000 (UTC)
Subject: Re: [PATCH] iommu: Add padding to struct iommu_fault
To: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>, joro@8bytes.org
References: <20190612131143.GF21613@8bytes.org>
	<20190612175938.16428-1-jean-philippe.brucker@arm.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <e80517b6-843f-6786-4a86-dc0c019e5e7b@redhat.com>
Date: Wed, 12 Jun 2019 21:19:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190612175938.16428-1-jean-philippe.brucker@arm.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Wed, 12 Jun 2019 19:19:43 +0000 (UTC)
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

Hi Jean,

On 6/12/19 7:59 PM, Jean-Philippe Brucker wrote:
> Ease future extensions of struct iommu_fault_page_request and struct
> iommu_fault_unrecoverable by adding a few bytes of padding. That way, a
> new field can be added to either of these structures by simply introducing
> a new flag. To extend it after the size limit is reached, a new fault
> reporting structure will have to be negotiated with userspace.
> 
> With 56 bytes of padding, the total size of iommu_fault is 64 bytes and
> fits in a cache line on a lot of contemporary machines, while providing 16
> and 24 bytes of extension to structures iommu_fault_page_request and
> iommu_fault_unrecoverable respectively.
> 
> Signed-off-by: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric

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
>  /**
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
