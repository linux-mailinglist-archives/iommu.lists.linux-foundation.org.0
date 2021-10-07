Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2DF425E1C
	for <lists.iommu@lfdr.de>; Thu,  7 Oct 2021 22:49:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5980060653;
	Thu,  7 Oct 2021 20:49:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XO4bh8HbpBSz; Thu,  7 Oct 2021 20:49:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 76B9E60800;
	Thu,  7 Oct 2021 20:49:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 468B8C001E;
	Thu,  7 Oct 2021 20:49:08 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5B104C000D
 for <iommu@lists.linux-foundation.org>; Thu,  7 Oct 2021 20:49:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 570F2404D6
 for <iommu@lists.linux-foundation.org>; Thu,  7 Oct 2021 20:49:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eGE1YUIL2LqS for <iommu@lists.linux-foundation.org>;
 Thu,  7 Oct 2021 20:49:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 33D33404BB
 for <iommu@lists.linux-foundation.org>; Thu,  7 Oct 2021 20:49:05 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id kk10so5856558pjb.1
 for <iommu@lists.linux-foundation.org>; Thu, 07 Oct 2021 13:49:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=bhgPzo/xge5/zFI2TSPfpgswsPE9zHpB8iHMVkQHlSw=;
 b=jI9nq91FC8rOOui8jGO8sglNaGKserkkZQ8zpLMKvtnOot+ZzxLVwmEpspyWhkEwOj
 ynAJoTDWnWjCs/e5do50HTfEdL5GlIrsbnAkHpikDeFk63Q+oHmhpi23U57DzboQ1H+i
 1DFGzDSnSKy99ymTAFYz7hk+TDKTh1prB6oGBqqVlO3ej1v7NeTdqh8DWNepH+bt5COy
 NvIvzWv0jmcbB0+Q7RTH6TSSJCrKPudoAKJIhcc8RmL0ymrwpFuT8nMI1lTtccwlgpEu
 ST79XaDFTaoFinmIZrJpHGfHZ8WcwkwOzCWKTMx8joQrimsuuBANsfIO1zJzX4jzUGLn
 rG5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=bhgPzo/xge5/zFI2TSPfpgswsPE9zHpB8iHMVkQHlSw=;
 b=Gz5ynm5qFYbHOoe8b4oPy2shaCQVlPnhbBel23QTfm8IwNrYQc/+3kCVrOdBTtjyMD
 x4Jhd6092m+yFR/R/DW4vgP0Znn9Oo9VtcHAAq4QAQjnl/OW/VAOsC/f2wnYUVj325Pu
 3ryO5Qfm135i6rpcmUy3m0RYEI+TUqJpJq03kJdrU5RmQiOKHaK0pt5Lmzvrj7jESlLw
 YfsiOkteIgF+ruLp//hOB0VvBvhl1ElY5TZTruo1CSqLaV4iOvE7jeY2JL/Et6/I0ZT2
 boUAfZCNYcB1oTKdIH5KIZ2ui8mj7grsHdj7HVxB1GiYlspZKGO7s0oA9pEIbKT4H+Bf
 0Z2Q==
X-Gm-Message-State: AOAM532yziVsIxzOB86dFTXO+vh7laBpSLDf947oqCngZ6DIkC9N9nBp
 pKSpqyr9t+O+0ad4kTLG1qc=
X-Google-Smtp-Source: ABdhPJwTfQIIFj6A+SKeWcAntMwEp6giOe8pAQOzHut75MmdlBJMJYeol8+c3sUZA+CVZHY8ngTnlw==
X-Received: by 2002:a17:90b:3b8e:: with SMTP id
 pc14mr7413160pjb.180.1633639744494; 
 Thu, 07 Oct 2021 13:49:04 -0700 (PDT)
Received: from Asurada-Nvidia (thunderhill.nvidia.com. [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id 1sm281000pfm.163.2021.10.07.13.49.03
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 07 Oct 2021 13:49:04 -0700 (PDT)
Date: Thu, 7 Oct 2021 13:41:31 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v6 6/6] iommu/tegra-smmu: Add pagetable mappings to debugfs
Message-ID: <20211007204131.GC20821@Asurada-Nvidia>
References: <20210914013858.31192-1-nicoleotsuka@gmail.com>
 <20210914013858.31192-7-nicoleotsuka@gmail.com>
 <YV8qtdicr4+PcIAf@orome.fritz.box>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YV8qtdicr4+PcIAf@orome.fritz.box>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 jonathanh@nvidia.com, linux-tegra@vger.kernel.org, digetx@gmail.com,
 will@kernel.org
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

On Thu, Oct 07, 2021 at 07:13:25PM +0200, Thierry Reding wrote:
> > @@ -496,6 +506,8 @@ static void tegra_smmu_as_unprepare(struct tegra_smmu *smmu,
> >  	mutex_unlock(&smmu->lock);
> >  }
> >  
> > +static const struct file_operations tegra_smmu_debugfs_mappings_fops;
> 
> Could the implementation be moved up here to avoid the forward
> declaration?

I thought that keeping all debugfs fops together would be preferable.
But yes, I will move it if you prefer no-additional forward declare.

> > +	seq_printf(s, "\nSWGROUP: %s\n", swgrp->name);
> > +	seq_printf(s, "as->id: %d\nas->attr: %c|%c|%s\nas->pd_dma: %pad\n", as->id,
> > +		   as->attr & SMMU_PD_READABLE ? 'R' : '-',
> > +		   as->attr & SMMU_PD_WRITABLE ? 'W' : '-',
> > +		   as->attr & SMMU_PD_NONSECURE ? "NS" : "S",
> > +		   &as->pd_dma);
> > +	seq_puts(s, "{\n");
> 
> Maybe this can be more compact by putting the name, ID, attributes and
> base address onto a single line? Maybe also use "'-' : 'S'" for the
> non-secure attribute to keep in line with what you've done for readable
> and writable attributes.

Okay. Will change that.

> Then again, this is going to be very verbose output anyway, so maybe it
> isn't worth it.

Are you saying the whole debugfs thing or just attributes? Yet, for
either case, I don't think so, as mappings info would help for sure
from our past experience while the attributes are just one line...
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
