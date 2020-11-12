Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BC212B085D
	for <lists.iommu@lfdr.de>; Thu, 12 Nov 2020 16:27:25 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id B3159877FF;
	Thu, 12 Nov 2020 15:27:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qgUUYuxSp5p9; Thu, 12 Nov 2020 15:27:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4E294877FB;
	Thu, 12 Nov 2020 15:27:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 36522C016F;
	Thu, 12 Nov 2020 15:27:23 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7B5DEC016F
 for <iommu@lists.linux-foundation.org>; Thu, 12 Nov 2020 15:27:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 695E9877D1
 for <iommu@lists.linux-foundation.org>; Thu, 12 Nov 2020 15:27:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uDCoPpFiW1U6 for <iommu@lists.linux-foundation.org>;
 Thu, 12 Nov 2020 15:27:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by hemlock.osuosl.org (Postfix) with ESMTPS id CB25D8779E
 for <iommu@lists.linux-foundation.org>; Thu, 12 Nov 2020 15:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605194839;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EToCEhKZCbY5qYquKZLEYM9Zxm5PVC8drZdaa3o0iK0=;
 b=PuQBexc5JbCrk+JoA+JCE26rlSNwjZWYKXfp2JIqlFW2U0Q+t88K8pzkGhK0ymQVlV/tGX
 guXj3F218sMNcTOKRsrx1mh+KaLBihj3UZTh1BqNRC8pfLV3oX1fsv7nFVCpwN4Qbmje18
 0roGsJf6NJ9LJngCi4+ySlIWN2/yKyM=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-433-v6UmUmUNNUeIZiM55104Bg-1; Thu, 12 Nov 2020 10:27:17 -0500
X-MC-Unique: v6UmUmUNNUeIZiM55104Bg-1
Received: by mail-wr1-f71.google.com with SMTP id h11so2069426wrq.20
 for <iommu@lists.linux-foundation.org>; Thu, 12 Nov 2020 07:27:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=EToCEhKZCbY5qYquKZLEYM9Zxm5PVC8drZdaa3o0iK0=;
 b=dHyWJ4rr3L89qOkoRB0uWLch/d4nlTa8QDPi4tDSSRw60llBMPoS2ACe/3cf3pFYFK
 cKoGPaBlFqifS5frbk4z3ROva13OkrdD+oLiRadW+kGu6bCtNW/U7FhIHQQ9PNlum+bu
 wA0AbIK2ErgWudb8rL1EDlhL9/z/rzxW9Dxaxu+rb0jW4CQDbQCff21A9LU+xDcuFp6y
 8QAYMtcwBX2zLJO7P2IhUAax14snAvaIi+s9Saqr1h1uwRs5lb9meDb3a2BwSQHF3fA3
 mPhuO1iHWivyVfh1aFbY8x60KEJze3OTQtQF8aJzYBXSLdRbN1JKqLIihfXj0/cxMgU5
 +oPQ==
X-Gm-Message-State: AOAM531PAbKT+HfhSNkPZfq9LGkEafnnJnxWPa0bUL6IUO3BSnuzZKVs
 9cpz70ZmSxBtv+PXTgu9XkB/nHLMRO0eAeDZk5iwgb6uDnNnC8Uj6HJ+AknElSicjtjHIiJPfaI
 kQNYKeHUHPWu1p/m7wbkC/OTLFbx7AsX32gAX5TqloqFBh5urp3EedO2qW8aYynoyq9Y1g8OUZF
 t4nnG8Cw==
X-Received: by 2002:adf:e44f:: with SMTP id t15mr57373wrm.380.1605194836359;
 Thu, 12 Nov 2020 07:27:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwAEjBmoTH4/mr7/4f2REbvjuU/hHE1H+2TbgcnFk0M+o34TM33nSDmKd9yjYVLC54SujLB8w==
X-Received: by 2002:adf:e44f:: with SMTP id t15mr57335wrm.380.1605194836113;
 Thu, 12 Nov 2020 07:27:16 -0800 (PST)
Received: from vitty.brq.redhat.com (g-server-2.ign.cz. [91.219.240.2])
 by smtp.gmail.com with ESMTPSA id a9sm7378333wrp.21.2020.11.12.07.27.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Nov 2020 07:27:15 -0800 (PST)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: Wei Liu <wei.liu@kernel.org>, Linux on Hyper-V List
 <linux-hyperv@vger.kernel.org>
Subject: Re: [PATCH v2 04/17] iommu/hyperv: don't setup IRQ remapping when
 running as root
In-Reply-To: <20201105165814.29233-5-wei.liu@kernel.org>
References: <20201105165814.29233-1-wei.liu@kernel.org>
 <20201105165814.29233-5-wei.liu@kernel.org>
Date: Thu, 12 Nov 2020 16:27:14 +0100
Message-ID: <87ft5ey4rx.fsf@vitty.brq.redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vkuznets@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: "K. Y. Srinivasan" <kys@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 Joerg Roedel <jroedel@suse.de>, Stephen Hemminger <sthemmin@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 Michael Kelley <mikelley@microsoft.com>, "open list:IOMMU
 DRIVERS" <iommu@lists.linux-foundation.org>,
 Nuno Das Neves <nunodasneves@linux.microsoft.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 virtualization@lists.linux-foundation.org,
 Vineeth Pillai <viremana@linux.microsoft.com>
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

Wei Liu <wei.liu@kernel.org> writes:

> The IOMMU code needs more work. We're sure for now the IRQ remapping
> hooks are not applicable when Linux is the root.

Super-nitpick: I would suggest we always say 'root partition' as 'root'
has a 'slightly different' meaning in Linux and this commit message may
sound confusing to an unprepared reader.

>
> Signed-off-by: Wei Liu <wei.liu@kernel.org>
> Acked-by: Joerg Roedel <jroedel@suse.de>
> ---
>  drivers/iommu/hyperv-iommu.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/iommu/hyperv-iommu.c b/drivers/iommu/hyperv-iommu.c
> index e09e2d734c57..8d3ce3add57d 100644
> --- a/drivers/iommu/hyperv-iommu.c
> +++ b/drivers/iommu/hyperv-iommu.c
> @@ -20,6 +20,7 @@
>  #include <asm/io_apic.h>
>  #include <asm/irq_remapping.h>
>  #include <asm/hypervisor.h>
> +#include <asm/mshyperv.h>
>  
>  #include "irq_remapping.h"
>  
> @@ -143,7 +144,7 @@ static int __init hyperv_prepare_irq_remapping(void)
>  	int i;
>  
>  	if (!hypervisor_is_type(X86_HYPER_MS_HYPERV) ||
> -	    !x2apic_supported())
> +	    !x2apic_supported() || hv_root_partition)
>  		return -ENODEV;
>  
>  	fn = irq_domain_alloc_named_id_fwnode("HYPERV-IR", 0);

Reviewed-by: Vitaly Kuznetsov <vkuznets@redhat.com>

-- 
Vitaly

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
