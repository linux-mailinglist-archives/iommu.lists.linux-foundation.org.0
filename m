Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B9EA1104DC
	for <lists.iommu@lfdr.de>; Tue,  3 Dec 2019 20:14:43 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id D380487894;
	Tue,  3 Dec 2019 19:14:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qBeJspvUuaak; Tue,  3 Dec 2019 19:14:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 0E23787881;
	Tue,  3 Dec 2019 19:14:41 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EA343C087F;
	Tue,  3 Dec 2019 19:14:40 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 754C4C087F
 for <iommu@lists.linux-foundation.org>; Tue,  3 Dec 2019 19:14:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 6ED2286D6B
 for <iommu@lists.linux-foundation.org>; Tue,  3 Dec 2019 19:14:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y6AMSNF-pTdQ for <iommu@lists.linux-foundation.org>;
 Tue,  3 Dec 2019 19:14:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
 [209.85.167.195])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id E4A2886D5B
 for <iommu@lists.linux-foundation.org>; Tue,  3 Dec 2019 19:14:38 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id l136so4428137oig.1
 for <iommu@lists.linux-foundation.org>; Tue, 03 Dec 2019 11:14:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=gRLlFC9D1u1hwI1d/EbEjZ94RjJCTsPp84ZAxR2T34c=;
 b=HM4FcxNtZZmyhuXKvQmOKN+58+v9wIS8BMIZHtgm+l8K5hxZlIOdloWCx0WhhWTgZq
 WuyaxdAmfI79FSA1TvC7jFF/QPwDg5M9PtN+0p41AD2+Vqka3H9MaX0Zew2NnYIqQYli
 l3EjycNZSXl0XbSn2Q9tGNaPv/F5L2PLEMiVyjbXAtlrQRqIwcQh1ggUJzIDZ0yeM/cT
 8qt30Q7xN2QQ+2UPaHoYoezqaE63MQEJ5VT3+Vgd5Hw7Vw3bZx99tRhKrGWlx9l7Iqsa
 Le3txghM0EP2LMWWAEyc/ruaA+49QIhGrIQo6oR2IP5WYuJdN8lbtKxm0KkO3p2UNZ0W
 bj2Q==
X-Gm-Message-State: APjAAAXfIVBzEJDgrPvSunDh2mSS0BBcgdG22Hknjydw3HaY/jb5g/Jy
 oPJPrsph1Ek2UTzG0u5AZg==
X-Google-Smtp-Source: APXvYqwfW6cNdzLLtGnRM6Eeh4eI3J0OXPCG+lnr/0NSOIKOUhB/2E6cGltU8AStJzERHBVHvLKFWQ==
X-Received: by 2002:aca:b2c5:: with SMTP id b188mr1686191oif.55.1575400477922; 
 Tue, 03 Dec 2019 11:14:37 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id w72sm1413333oie.49.2019.12.03.11.14.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Dec 2019 11:14:37 -0800 (PST)
Date: Tue, 3 Dec 2019 13:14:36 -0600
From: Rob Herring <robh@kernel.org>
To: Jordan Crouse <jcrouse@codeaurora.org>
Subject: Re: [PATCH v2 1/8] dt-bindings: arm-smmu: Add Adreno GPU variant
Message-ID: <20191203191436.GA11606@bogus>
References: <1574465484-7115-1-git-send-email-jcrouse@codeaurora.org>
 <0101016e95751ea5-da4da251-ddba-4017-9258-b2cfd4e06f7f-000000@us-west-2.amazonses.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0101016e95751ea5-da4da251-ddba-4017-9258-b2cfd4e06f7f-000000@us-west-2.amazonses.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 robin.murphy@arm.com, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, linux-arm-msm@vger.kernel.org,
 will@kernel.org, linux-arm-kernel@lists.infradead.org
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

On Fri, Nov 22, 2019 at 11:31:51PM +0000, Jordan Crouse wrote:
> Add a compatible string to identify SMMUs that are attached
> to Adreno GPU devices that wish to support split pagetables.
> 
> Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> ---
> 
>  Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
