Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D46E2191A4
	for <lists.iommu@lfdr.de>; Wed,  8 Jul 2020 22:37:34 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1F253861C8;
	Wed,  8 Jul 2020 20:37:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id of2gaIn2nGkh; Wed,  8 Jul 2020 20:37:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id BB3158623F;
	Wed,  8 Jul 2020 20:37:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A76DDC016F;
	Wed,  8 Jul 2020 20:37:32 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2E039C016F
 for <iommu@lists.linux-foundation.org>; Wed,  8 Jul 2020 20:37:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 2A08686239
 for <iommu@lists.linux-foundation.org>; Wed,  8 Jul 2020 20:37:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f7DvoDdUSnxY for <iommu@lists.linux-foundation.org>;
 Wed,  8 Jul 2020 20:37:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
 [209.85.214.194])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id A0028861C8
 for <iommu@lists.linux-foundation.org>; Wed,  8 Jul 2020 20:37:30 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id q17so4239654pls.9
 for <iommu@lists.linux-foundation.org>; Wed, 08 Jul 2020 13:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=b0NVbZDhjlBz7Bz/rREiap5i+ELfKwqgcjVz9t4TTWc=;
 b=WX27OhwhfF1KO+Ze6CViHQ8qJvqRJbMGHiVeDjQ3KN4OdaIGhwEotGDNgJpxfOpo34
 P7sVZT9G4J2rU18HGZ9XwWGeEyfz8qbrMKyw0Nc6f/lWq3tlczK5p7rkBk3OTmtUhZoC
 0XX39qoyDkkF3H2PsAtmqIJ1fzfPRz5Qje3jlaZ7+gLNE/QfarSQH53j4dtxSLJ+Dotd
 fRP7a+3urPj3LslktzHbQ6Uk8V285v2+y7rPWTNxF1OEka3uHqU31CIC9l3jO4gdSFeC
 iHOt/XUgOrv96AlaCkTNtSqxYwyUlJtXhVsSIBbNa1y8VBWbKJHDtCtqTPgjWs1TXazC
 jE9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=b0NVbZDhjlBz7Bz/rREiap5i+ELfKwqgcjVz9t4TTWc=;
 b=sej3WwYI8XfV4zQy5T7c5XTTrBAv6oU2GSgmCa+j083gPlbMkYgVJXPbYhYe3MFyfr
 qPTJo+sr8ThAZD53qBaOe9gZJmAAlS3thLuc2Nw4iAQY0Rcx/UkOzU4BYjXookyLGN76
 Nm/jkR4Fiy5kGJia1X+c2qEQ0n9KE6qcWbRfZnQcGUHKCP/pwTlQfgnICeFb07tbZrbu
 9KHnLaII70E3xHSK2H/++cNkYsvoxbYNo5OLU2lytA2w64z1gSotXOY9/lAcf4si5tuW
 7pU7X8ht//KpsT8SD/pbbNUCL9aCJa3wsoJ4q04SsLDcwwBsaxlG+QejB1CL98D1McER
 H8uw==
X-Gm-Message-State: AOAM533ZnTv6A99zySp4r/ZEO0vhHlsq8TSFFrmqXl/Z9Z5wYa97bXc8
 vXOic/gJDOZBtkdh2dvpJ3o=
X-Google-Smtp-Source: ABdhPJyiTorvYGWMmyw6VBYhC7TYxyusceeTAkVhfb9NoC7jwAGTNw/fEoGLr1V8Fvfo0WhkIgS09w==
X-Received: by 2002:a17:902:7241:: with SMTP id
 c1mr44905580pll.79.1594240650250; 
 Wed, 08 Jul 2020 13:37:30 -0700 (PDT)
Received: from Asurada-Nvidia (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id g5sm365707pjl.31.2020.07.08.13.37.29
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 08 Jul 2020 13:37:29 -0700 (PDT)
Date: Wed, 8 Jul 2020 13:37:17 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Krishna Reddy <vdumpa@nvidia.com>
Subject: Re: [PATCH v10 1/5] iommu/arm-smmu: move TLB timeout and spin count
 macros
Message-ID: <20200708203716.GC28080@Asurada-Nvidia>
References: <20200708050017.31563-1-vdumpa@nvidia.com>
 <20200708050017.31563-2-vdumpa@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200708050017.31563-2-vdumpa@nvidia.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: snikam@nvidia.com, devicetree@vger.kernel.org, mperttunen@nvidia.com,
 praithatha@nvidia.com, bhuntsman@nvidia.com, will@kernel.org,
 linux-kernel@vger.kernel.org, jonathanh@nvidia.com, talho@nvidia.com,
 iommu@lists.linux-foundation.org, robh+dt@kernel.org, nicolinc@nvidia.com,
 linux-tegra@vger.kernel.org, yhsu@nvidia.com, treding@nvidia.com,
 robin.murphy@arm.com, linux-arm-kernel@lists.infradead.org, bbiswas@nvidia.com
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

On Tue, Jul 07, 2020 at 10:00:13PM -0700, Krishna Reddy wrote:
> Move TLB timeout and spin count macros to header file to
> allow using the same from vendor specific implementations.
> 
> Signed-off-by: Krishna Reddy <vdumpa@nvidia.com>

Reviewed-by: Nicolin Chen <nicoleotsuka@gmail.com>
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
