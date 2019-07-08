Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id F04B961B8E
	for <lists.iommu@lfdr.de>; Mon,  8 Jul 2019 10:07:49 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 7F36A218E;
	Mon,  8 Jul 2019 08:07:34 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 164551F48
	for <iommu@lists.linux-foundation.org>;
	Mon,  8 Jul 2019 07:58:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id B2509148
	for <iommu@lists.linux-foundation.org>;
	Mon,  8 Jul 2019 07:58:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 268CB3092640;
	Mon,  8 Jul 2019 07:58:34 +0000 (UTC)
Received: from [10.36.116.46] (ovpn-116-46.ams2.redhat.com [10.36.116.46])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BDBC018ACB;
	Mon,  8 Jul 2019 07:58:31 +0000 (UTC)
Subject: Re: [PATCH 2/8] dt-bindings: document PASID property for IOMMU masters
To: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>, will.deacon@arm.com
References: <20190610184714.6786-1-jean-philippe.brucker@arm.com>
	<20190610184714.6786-3-jean-philippe.brucker@arm.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <4a90dc21-e727-b2f6-1353-cb08babf0ec2@redhat.com>
Date: Mon, 8 Jul 2019 09:58:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190610184714.6786-3-jean-philippe.brucker@arm.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Mon, 08 Jul 2019 07:58:34 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
	robh+dt@kernel.org, robin.murphy@arm.com,
	linux-arm-kernel@lists.infradead.org
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

On 6/10/19 8:47 PM, Jean-Philippe Brucker wrote:
> On Arm systems, some platform devices behind an SMMU may support the PASID
> feature, which offers multiple address space. Let the firmware tell us
> when a device supports PASID.
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
> ---
> Previous discussion on this patch last year:
> https://patchwork.ozlabs.org/patch/872275/
> I split PASID and stall definitions, keeping only PASID here.
> ---
>  Documentation/devicetree/bindings/iommu/iommu.txt | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/iommu/iommu.txt b/Documentation/devicetree/bindings/iommu/iommu.txt
> index 5a8b4624defc..3c36334e4f94 100644
> --- a/Documentation/devicetree/bindings/iommu/iommu.txt
> +++ b/Documentation/devicetree/bindings/iommu/iommu.txt
> @@ -86,6 +86,12 @@ have a means to turn off translation. But it is invalid in such cases to
>  disable the IOMMU's device tree node in the first place because it would
>  prevent any driver from properly setting up the translations.
>  
> +Optional properties:
> +--------------------
> +- pasid-num-bits: Some masters support multiple address spaces for DMA, by
> +  tagging DMA transactions with an address space identifier. By default,
> +  this is 0, which means that the device only has one address space.
> +
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric
>  
>  Notes:
>  ======
> 

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
