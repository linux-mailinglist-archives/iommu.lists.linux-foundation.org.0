Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 468C921978F
	for <lists.iommu@lfdr.de>; Thu,  9 Jul 2020 06:43:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id CB3362154A;
	Thu,  9 Jul 2020 04:43:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 38wah4UDgnrp; Thu,  9 Jul 2020 04:43:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 459CF204CE;
	Thu,  9 Jul 2020 04:43:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2EF6EC016F;
	Thu,  9 Jul 2020 04:43:56 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DF2F6C016F
 for <iommu@lists.linux-foundation.org>; Thu,  9 Jul 2020 04:43:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id CDB5B8952C
 for <iommu@lists.linux-foundation.org>; Thu,  9 Jul 2020 04:43:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P69e3ggcTWMe for <iommu@lists.linux-foundation.org>;
 Thu,  9 Jul 2020 04:43:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
 [209.85.214.193])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 30BC689523
 for <iommu@lists.linux-foundation.org>; Thu,  9 Jul 2020 04:43:54 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id q17so314851pls.9
 for <iommu@lists.linux-foundation.org>; Wed, 08 Jul 2020 21:43:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=uYFWXsn6/lmz5ncMBjNDIoIoMFK4tdm/Q5x2mlsCoiI=;
 b=EaBPBeSfNjYdLPMxKFn3vKHHQTk5DSQ1a6GPgTC0RJBdk3vV5Rz4W5hW1lxLQTcKee
 SQiBOIbmK4ZEu66KcjHN93aQcF3i+4Y0HkohdNaED7tbe1nNfNA/Je0FMcyEXbEYbwZz
 yGLL9ktIkHKt3RAYVIW4mdMZEwF87KWgALxa5rFAzeBB9izvi00SM8sXpB+bj5NC3HBO
 UZlZ9hKFDUZ7F4qkTRn6hSj6Yr6ZPRir36NPKvxiwoP9tDRiXg9ADUi6RCffMQ1XHnNg
 WkRko8g50tJwH7rXSdhWz61K8WZZv04UhednMu0IK/LAJNzubu0wSqiHsE9NO6WPtLF6
 JMNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=uYFWXsn6/lmz5ncMBjNDIoIoMFK4tdm/Q5x2mlsCoiI=;
 b=D75g6nCGqpJ0Y9VXXN+WcGKQk49PEMV8ntffUH358YRkTKqg8wSNfUyAbV1hv+U7MS
 niDqB267YTEYKOGMHyPNGN4H2SxwoOhj6rOLAuygbJitiyl2lGpm4TclZKEM5n0My7qW
 TdShvngTBSsfpQHEw6w+0u9foHznWhN67ds6TwNdm/bVX2Pm2dqZ1CCjXWIaDsGv7DOB
 gHh65mssNSERtKq0ze/jwZLC7Dmd3Hm7Y9f6oOYT33bH5bbejUWVHlw+sBeGErHdti6A
 pOEuvi/Xl/rLUUDdvIF+cm/VM4pjN2I2sIBnGa6mmej0MFSlm/srspEFFq2SwR9XI4B/
 9IkQ==
X-Gm-Message-State: AOAM532sQ7jZgHYPCbGZKa2pB9XjJlrGSTTdZxh8ASl3hResMxZfv277
 A6gNSp7UT8zaUkAxwykZpDPF9w==
X-Google-Smtp-Source: ABdhPJxJHTDRM74uOKDi3SikC5ArM6o0/DCY1lNNoz2eFTGKxdAZS39R0GDvGntXe5ZbIYSVT0WPQw==
X-Received: by 2002:a17:902:d698:: with SMTP id
 v24mr22151646ply.163.1594269833703; 
 Wed, 08 Jul 2020 21:43:53 -0700 (PDT)
Received: from ripper (104-188-17-28.lightspeed.sndgca.sbcglobal.net.
 [104.188.17.28])
 by smtp.gmail.com with ESMTPSA id j26sm1152574pfe.200.2020.07.08.21.43.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jul 2020 21:43:52 -0700 (PDT)
Date: Wed, 8 Jul 2020 21:44:20 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Will Deacon <will@kernel.org>
Subject: Re: [PATCH v2 0/8] arm64: dts: qcom: smmu/USB nodes and
 HDK855/HDK865 dts
Message-ID: <20200709044420.GB3453565@ripper>
References: <20200609194030.17756-1-jonathan@marek.ca>
 <20200703123113.GA18953@willie-the-truck>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200703123113.GA18953@willie-the-truck>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Jonathan Marek <jonathan@marek.ca>,
 linux-arm-msm@vger.kernel.org, open list <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Andy Gross <agross@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
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

On Fri 03 Jul 05:31 PDT 2020, Will Deacon wrote:

> On Tue, Jun 09, 2020 at 03:40:18PM -0400, Jonathan Marek wrote:
> > Add dts nodes for apps_smmu and USB for both sm8150 and sm8250.
> > 
> > Also add initial dts files for HDK855 and HDK865, based on mtp dts, with a
> > few changes. Notably, the HDK865 dts has regulator config changed a bit based
> > on downstream (I think sm8250-mtp.dts is wrong and copied too much from sm8150).
> > 
> > V2 changes:
> > * Added two patches for sm8150 and sm8250 iommu compatibles
> > * Changed apps_smmu node patches to use new compatibles
> > * Updated commit messages for apps_smmu patches to be more correct
> > * Updated HDK dts patches based on Bjorn's comments
> > 
> > Jonathan Marek (8):
> >   dt-bindings: arm-smmu: Add sm8150 and sm8250 compatible strings
> >   iommu: arm-smmu-impl: Use qcom impl for sm8150 and sm8250 compatibles
> >   arm64: dts: qcom: sm8150: add apps_smmu node
> >   arm64: dts: qcom: sm8250: add apps_smmu node
> >   arm64: dts: qcom: sm8150: Add secondary USB and PHY nodes
> >   arm64: dts: qcom: sm8250: Add USB and PHY device nodes
> >   arm64: dts: qcom: add sm8150 hdk dts
> >   arm64: dts: qcom: add sm8250 hdk dts
> 
> What's your plan for merging this? I can take the first two patches
> via arm-smmu, if you like. Please just let me know.
> 

Please pick up the binding and driver patch through your tree.

Regards,
Bjorn
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
