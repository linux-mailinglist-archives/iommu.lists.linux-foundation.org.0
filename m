Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A05C3B36F9
	for <lists.iommu@lfdr.de>; Thu, 24 Jun 2021 21:26:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C17E0401E9;
	Thu, 24 Jun 2021 19:26:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1wX0-obuCkZv; Thu, 24 Jun 2021 19:26:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id EE7C840187;
	Thu, 24 Jun 2021 19:26:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B5BC8C0022;
	Thu, 24 Jun 2021 19:26:30 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CF701C000E
 for <iommu@lists.linux-foundation.org>; Thu, 24 Jun 2021 19:26:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BB7C483E25
 for <iommu@lists.linux-foundation.org>; Thu, 24 Jun 2021 19:26:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PmGcmaVVVbz2 for <iommu@lists.linux-foundation.org>;
 Thu, 24 Jun 2021 19:26:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com
 [209.85.166.170])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8E7A283CC7
 for <iommu@lists.linux-foundation.org>; Thu, 24 Jun 2021 19:26:27 +0000 (UTC)
Received: by mail-il1-f170.google.com with SMTP id o10so2565983ils.6
 for <iommu@lists.linux-foundation.org>; Thu, 24 Jun 2021 12:26:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=6h1Sx3JbYU2baky6rD9hMRn1kfJYQMiqvIqi3obyV8I=;
 b=Wbv5oozK/cl+gUpJgV9Ze5sf4535P2NWepgD6kWZ+m/A11NsTVbIvx5xsTqaoh4ekt
 wP3DCcZo13Ou48MfndI1OLVZ+iFRJkKHcxbdXm0Sm0lhhmgkvCIfu0yKhF62ItXskF2m
 HgAxKnAOLT4xV8PauN1L6ZSc3BWgbiiyQielVGAES3Xbd8FZd0JrqF2QfvQ1btuDDisM
 ksPQl9PM7Ui0pSgvpI/992C8PNWL6jG+3ziiHh8KK6K0qKpFPXkZib2b5RDYBeylJhb5
 L98NkS9wTjR1nB4nZsLBOZAcdW/9Wm6k8JCjcj3xOEG/JFr5P+PsjZrBBnYt4DhWoSu2
 zsqA==
X-Gm-Message-State: AOAM530dlFzrNIrA9u7kWDrih3JdGe7zB3kJVb8oTZZmkphzqS+/P93y
 7m1PujOMkEn31nl6rxvr+A==
X-Google-Smtp-Source: ABdhPJz0Vgwv3Iq8nazL1YEj6niGuV9FnumXPQVtk8MmnklrGEOvQn76JOi0eS/UbHwhIZJMgNMjvQ==
X-Received: by 2002:a92:3610:: with SMTP id d16mr4554156ila.16.1624562786757; 
 Thu, 24 Jun 2021 12:26:26 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id r6sm1711534ioh.27.2021.06.24.12.26.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jun 2021 12:26:25 -0700 (PDT)
Received: (nullmailer pid 1846846 invoked by uid 1000);
 Thu, 24 Jun 2021 19:26:22 -0000
Date: Thu, 24 Jun 2021 13:26:22 -0600
From: Rob Herring <robh@kernel.org>
To: Martin Botka <martin.botka@somainline.org>
Subject: Re: [PATCH V3 1/2] dt-bindings: iommu: arm-smmu: Add binding for
 sm6125
Message-ID: <20210624192622.GA1846816@robh.at.kernel.org>
References: <20210612094606.89576-1-martin.botka@somainline.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210612094606.89576-1-martin.botka@somainline.org>
Cc: devicetree@vger.kernel.org, Will Deacon <will@kernel.org>,
 konrad.dybcio@somainline.org, linux-kernel@vger.kernel.org,
 jamipkettunen@somainline.org, iommu@lists.linux-foundation.org,
 Rob Herring <robh+dt@kernel.org>, ~postmarketos/upstreaming@lists.sr.ht,
 angelogioacchino.delregno@somainline.org, marijn.suijten@somainline.org,
 Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
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

On Sat, 12 Jun 2021 11:46:04 +0200, Martin Botka wrote:
> This patch adds binding for sm6125 SoC
> 
> Signed-off-by: Martin Botka <martin.botka@somainline.org>
> ---
> Changes in V2:
> Add commit description
> Changes in V3:
> None
>  Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
