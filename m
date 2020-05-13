Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id DACEB1D04D8
	for <lists.iommu@lfdr.de>; Wed, 13 May 2020 04:22:46 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7904A854D7;
	Wed, 13 May 2020 02:22:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hPwNZRtlBfKJ; Wed, 13 May 2020 02:22:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 58C3785540;
	Wed, 13 May 2020 02:22:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 31456C016F;
	Wed, 13 May 2020 02:22:42 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D629AC016F
 for <iommu@lists.linux-foundation.org>; Wed, 13 May 2020 02:22:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id D238A85E7C
 for <iommu@lists.linux-foundation.org>; Wed, 13 May 2020 02:22:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E+PXO4i9+5P7 for <iommu@lists.linux-foundation.org>;
 Wed, 13 May 2020 02:22:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
 [209.85.167.195])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 1B99785EB4
 for <iommu@lists.linux-foundation.org>; Wed, 13 May 2020 02:22:40 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id p127so649044oia.13
 for <iommu@lists.linux-foundation.org>; Tue, 12 May 2020 19:22:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=AaR/7VLqy6LVKQz0uPuHWvPqsrRu/xq4udfPwcoi4i4=;
 b=a1jC0EwnzIx+KdxJHoOYtKjtBdhnijIlcIQ2B5QZU/OJTXupS/3QuPYWtWCUL/PTrt
 7/pqVZd3X8w8lDocVVWcvvI8aCc6HGbHcFP1ZpQHYUW6GdGreposnOxy9wuhf3RYS0OW
 +AUbp2yL35H3OiMEvGDfuYsqyrNAFI9sbaWDsS3VTCV1O97Yz5Lxep7PL8VzK3FL6zcG
 EcVuPSrPfak0Ti8H+H8Nr6eJhiG+/T0QDz8q1LbrdxNo8rnWcywq76i3TFPDrAUfmsXS
 rlCzx9BnRGdh4uy9RcPs968E9nPz4pfBV+LtweenLO7GcKS7hLFDzNYqUVVY40MJ47oX
 9V8g==
X-Gm-Message-State: AGi0PuYXkclX8wAOg3NRY9CUkHhiuP39kzdLKeyMhiP2rmLuqt6qGTTw
 vOipfZ5LYFualp/6xxP0Vw==
X-Google-Smtp-Source: APiQypINVeEjqdUUaUFDCRteAcuJFXQ0VcFRi9yLFbPpHTTIaQYCJC8fJUkJltCCW9Ho2P4Z1GY8Xw==
X-Received: by 2002:aca:1818:: with SMTP id h24mr26212488oih.71.1589336559137; 
 Tue, 12 May 2020 19:22:39 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id q3sm1359956oth.2.2020.05.12.19.22.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2020 19:22:38 -0700 (PDT)
Received: (nullmailer pid 22790 invoked by uid 1000);
 Wed, 13 May 2020 02:22:37 -0000
Date: Tue, 12 May 2020 21:22:37 -0500
From: Rob Herring <robh@kernel.org>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH v3 2/5] dt-bindings: display: sun8i-mixer: Allow for an
 iommu property
Message-ID: <20200513022237.GA22733@bogus>
References: <cover.70f96f9afd2e04161ebece593ae6cd7e17eca41b.1588673353.git-series.maxime@cerno.tech>
 <ef88e9d96eafe3f921cfbe087c5f0a25a5dd41ac.1588673353.git-series.maxime@cerno.tech>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ef88e9d96eafe3f921cfbe087c5f0a25a5dd41ac.1588673353.git-series.maxime@cerno.tech>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 iommu@lists.linux-foundation.org, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>, linux-arm-kernel@lists.infradead.org
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

On Tue,  5 May 2020 12:09:31 +0200, Maxime Ripard wrote:
> The H6 mixer is attached to an IOMMU, so let's allow that property to be
> set in the bindings.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
