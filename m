Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ACB130A2A9
	for <lists.iommu@lfdr.de>; Mon,  1 Feb 2021 08:28:29 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id D9B5820117;
	Mon,  1 Feb 2021 07:28:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J4XRPzHPRRjD; Mon,  1 Feb 2021 07:28:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 3523920111;
	Mon,  1 Feb 2021 07:28:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 19E88C013A;
	Mon,  1 Feb 2021 07:28:27 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9BC5BC013A
 for <iommu@lists.linux-foundation.org>; Mon,  1 Feb 2021 07:28:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 7EB8A20111
 for <iommu@lists.linux-foundation.org>; Mon,  1 Feb 2021 07:28:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z+ZXF1eyznlB for <iommu@lists.linux-foundation.org>;
 Mon,  1 Feb 2021 07:28:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by silver.osuosl.org (Postfix) with ESMTPS id AF0F42010B
 for <iommu@lists.linux-foundation.org>; Mon,  1 Feb 2021 07:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612164503;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M16LXgfjhsKGuOXkKg0aEAVFa0oEYsjjqhuBQeuiHVY=;
 b=BD8aa01R73/6eDaFVKXM1pNCA7CIJG9KW+VbOfGH1dCEOLD7E4TuphoelOP9hJg1+IxCk3
 Y/0lKF5nA2bbzF1bwvF+XRS6TE0EX9+D/0F3hXycQ7E2SFoeSxSyOwj33yxIx3Dv4Gg521
 7IipFcvYAe2raEMZBFWu+8Rb4FCLNl8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-226-_I4TR1CRN0C5u37sUiyijw-1; Mon, 01 Feb 2021 02:28:19 -0500
X-MC-Unique: _I4TR1CRN0C5u37sUiyijw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 67551801817;
 Mon,  1 Feb 2021 07:28:16 +0000 (UTC)
Received: from [10.36.113.43] (ovpn-113-43.ams2.redhat.com [10.36.113.43])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CA69B70485;
 Mon,  1 Feb 2021 07:28:09 +0000 (UTC)
Subject: Re: [PATCH v12 08/10] dt-bindings: document stall property for IOMMU
 masters
To: Jean-Philippe Brucker <jean-philippe@linaro.org>, joro@8bytes.org,
 will@kernel.org
References: <20210127154322.3959196-1-jean-philippe@linaro.org>
 <20210127154322.3959196-9-jean-philippe@linaro.org>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <fa61a670-e11d-0493-a38f-132482b54e35@redhat.com>
Date: Mon, 1 Feb 2021 08:28:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20210127154322.3959196-9-jean-philippe@linaro.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Cc: devicetree@vger.kernel.org, kevin.tian@intel.com, vivek.gautam@arm.com,
 guohanjun@huawei.com, rjw@rjwysocki.net, linux-acpi@vger.kernel.org,
 iommu@lists.linux-foundation.org, robh+dt@kernel.org,
 linux-accelerators@lists.ozlabs.org, sudeep.holla@arm.com,
 zhangfei.gao@linaro.org, robin.murphy@arm.com, Rob Herring <robh@kernel.org>,
 linux-arm-kernel@lists.infradead.org, lenb@kernel.org
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

Hi Jean-Philippe,

On 1/27/21 4:43 PM, Jean-Philippe Brucker wrote:
> On ARM systems, some platform devices behind an IOMMU may support stall,
> which is the ability to recover from page faults. Let the firmware tell us
> when a device supports stall.
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
> ---
>  .../devicetree/bindings/iommu/iommu.txt        | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/iommu/iommu.txt b/Documentation/devicetree/bindings/iommu/iommu.txt
> index 3c36334e4f94..26ba9e530f13 100644
> --- a/Documentation/devicetree/bindings/iommu/iommu.txt
> +++ b/Documentation/devicetree/bindings/iommu/iommu.txt
> @@ -92,6 +92,24 @@ Optional properties:
>    tagging DMA transactions with an address space identifier. By default,
>    this is 0, which means that the device only has one address space.
>  
> +- dma-can-stall: When present, the master can wait for a transaction to
> +  complete for an indefinite amount of time. Upon translation fault some
> +  IOMMUs, instead of aborting the translation immediately, may first
> +  notify the driver and keep the transaction in flight. This allows the OS
> +  to inspect the fault and, for example, make physical pages resident
> +  before updating the mappings and completing the transaction. Such IOMMU
> +  accepts a limited number of simultaneous stalled transactions before
> +  having to either put back-pressure on the master, or abort new faulting
> +  transactions.
> +
> +  Firmware has to opt-in stalling, because most buses and masters don't
> +  support it. In particular it isn't compatible with PCI, where
> +  transactions have to complete before a time limit. More generally it
> +  won't work in systems and masters that haven't been designed for
> +  stalling. For example the OS, in order to handle a stalled transaction,
> +  may attempt to retrieve pages from secondary storage in a stalled
> +  domain, leading to a deadlock.
> +
>  
>  Notes:
>  ======
> 

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
