Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ACE71FD844
	for <lists.iommu@lfdr.de>; Thu, 18 Jun 2020 00:05:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9D9A38809D;
	Wed, 17 Jun 2020 22:05:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id suGI697qFoei; Wed, 17 Jun 2020 22:05:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 20BCF88093;
	Wed, 17 Jun 2020 22:05:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 16281C016E;
	Wed, 17 Jun 2020 22:05:29 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EB804C016E
 for <iommu@lists.linux-foundation.org>; Wed, 17 Jun 2020 22:05:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id D454F89366
 for <iommu@lists.linux-foundation.org>; Wed, 17 Jun 2020 22:05:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j71qRW0-pjPz for <iommu@lists.linux-foundation.org>;
 Wed, 17 Jun 2020 22:05:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
 [209.85.166.65])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 47074892A1
 for <iommu@lists.linux-foundation.org>; Wed, 17 Jun 2020 22:05:27 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id r2so4796697ioo.4
 for <iommu@lists.linux-foundation.org>; Wed, 17 Jun 2020 15:05:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=bIUyJbST3ILF2B5W5XHarSpDJ5TWO+TqPDggu/ATjbE=;
 b=ARS0ElbykrIl1ePNkRo2FofVTIfr8XkCYH3MaH9xPZVFPlaMlz3VoxvKby6oTbecyK
 1g9ZIKhHtEv90oDOtoj1ybbrJ1P0myMYtDqmmP4gD2Qke5j5cKTZGWnSSFsGSqz70Ai6
 tWM1Z8MvN/tLGL23W9RqNWoJBVw7RBJtHZOkCxKJkmS525FEeI1fh14s+KmLxiuHpSka
 xA3kJxNSzXxKR+BzJC3E0Vae/WkHuSGpPr8UVvmyNRLjeHy7oQR5DzwShSlaV3Mmc6tr
 O7lL5ZGAwfAgil99YpVN6xhDpN+nkC3ttqpbNFLSXBBQ1FQ1RMcHty/wSjQUAG6R9oIj
 uXzw==
X-Gm-Message-State: AOAM530PXT4x0zzZCXFFDwECqngIRmXyzqlIlZpMHX2jc26fBsAWwPEj
 igIO8K2TjjurPvqpc0WRhw==
X-Google-Smtp-Source: ABdhPJy+l4gL0/jpC1lHY9VpNr7LIfu5zc9ll9NHo0F7QdjgaK+SdSHKI5mgaI6ATemem9fRGF4/Iw==
X-Received: by 2002:a02:3402:: with SMTP id x2mr1362929jae.11.1592431526609;
 Wed, 17 Jun 2020 15:05:26 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id d11sm636626iod.11.2020.06.17.15.05.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2020 15:05:26 -0700 (PDT)
Received: (nullmailer pid 2913414 invoked by uid 1000);
 Wed, 17 Jun 2020 22:05:24 -0000
Date: Wed, 17 Jun 2020 16:05:24 -0600
From: Rob Herring <robh@kernel.org>
To: Jonathan Marek <jonathan@marek.ca>
Subject: Re: [PATCH v2 1/8] dt-bindings: arm-smmu: Add sm8150 and sm8250
 compatible strings
Message-ID: <20200617220524.GA2913365@bogus>
References: <20200609194030.17756-1-jonathan@marek.ca>
 <20200609194030.17756-2-jonathan@marek.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200609194030.17756-2-jonathan@marek.ca>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 Will Deacon <will@kernel.org>,
 "moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>
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

On Tue, 09 Jun 2020 15:40:19 -0400, Jonathan Marek wrote:
> Add compatible strings for sm8150 and sm8250 iommus to documentation.
> 
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>  Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
