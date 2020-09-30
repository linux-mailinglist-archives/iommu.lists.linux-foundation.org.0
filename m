Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DA3A27E2A1
	for <lists.iommu@lfdr.de>; Wed, 30 Sep 2020 09:31:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 2196D20347;
	Wed, 30 Sep 2020 07:31:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VekqxWi3KNKo; Wed, 30 Sep 2020 07:31:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 5481820396;
	Wed, 30 Sep 2020 07:31:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3AFA0C0051;
	Wed, 30 Sep 2020 07:31:18 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A04DAC0051
 for <iommu@lists.linux-foundation.org>; Wed, 30 Sep 2020 07:31:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 93E0B20396
 for <iommu@lists.linux-foundation.org>; Wed, 30 Sep 2020 07:31:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6Bx2ZI+aoUZD for <iommu@lists.linux-foundation.org>;
 Wed, 30 Sep 2020 07:31:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
 [209.85.216.67])
 by silver.osuosl.org (Postfix) with ESMTPS id 5B69B20347
 for <iommu@lists.linux-foundation.org>; Wed, 30 Sep 2020 07:31:15 +0000 (UTC)
Received: by mail-pj1-f67.google.com with SMTP id kk9so415415pjb.2
 for <iommu@lists.linux-foundation.org>; Wed, 30 Sep 2020 00:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=bwOTOwH4axl9LqPJmEo0RmLkZED4KKjttxbY58nlHVU=;
 b=ekxIJCZIESz5WSSsGf4/UfvtntXZpRaljNG8C88ia6EAPRAFmIhV+DTBBhuzHywGcI
 lbwQCkdhE6oB6NBNUaVy3F3Fnx/iYQUvqnQYXRFhlJS3fqeJgTaa/GtmBG7rO4c7qszV
 ZXpwT9F7D059JXWsKS3rDyxvB2rqeCltH1/ULMohSMyocoZHBajSxiR4ekNysVM6UPwh
 TA/U6o7KL3qJYlmtBK1ZkhoBJG1r4nnMmmR9R4Jg+myiIZWWn94ydCcZiPGTSzyFPtLG
 UwAuh4bPvS4FBkpwpACWcOWzD+NcR6Zfv3QwY8D/9XXbOD0nqYfhspMf6Z1sLQXqvh/x
 k7CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=bwOTOwH4axl9LqPJmEo0RmLkZED4KKjttxbY58nlHVU=;
 b=DaYH0EbZppqn+lpmcnJ5Ghfy38ut4r52kvRkOiBrHIDaaDF8NFEF8RiyPkugR7sjlu
 4piNjS3UoLBCaVFmnxUQ3mNhugYGQHTQiwQDf+DmEEnNmZtTwFVVBD40dIf8tbGIUBcC
 q9Xzt681vLihOznDmsHkirXq7JSOS2JFNOoGB4AOL4xyxWiNag8fwkC2bY12TxHVFxI+
 xa3IuzAU/IgwPNgrCqbUp6yDiDAHAHVKSbivl5o24wi36CMdCXtR+hRy9P7W5dfkxb0a
 rX5QkKMsbTevq3VaidZFk9qZP8G1qBooSKpiaIrE8dy7cSyEs1M2BomSf0jIxgDoZW54
 3SNg==
X-Gm-Message-State: AOAM532t1nOd6SPppUjCTz1AoUfJH8m4N56Lci7knbQt6GY7jUIH+DGY
 NzrNgUVYdUjsIFIzQrMLL2Y=
X-Google-Smtp-Source: ABdhPJwXuia3lh7dWuGxNLtu/8GKrMOmIAmVZsKyyiPZgKjMbUATljSUXVN3+rgD+15l0PNAx7d6mw==
X-Received: by 2002:a17:90b:93:: with SMTP id
 bb19mr1410705pjb.162.1601451074777; 
 Wed, 30 Sep 2020 00:31:14 -0700 (PDT)
Received: from Asurada-Nvidia (thunderhill.nvidia.com. [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id y16sm1370254pfb.154.2020.09.30.00.31.13
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 30 Sep 2020 00:31:14 -0700 (PDT)
Date: Wed, 30 Sep 2020 00:25:43 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 1/3] memory: tegra: Add helper function
 tegra_get_memory_controller
Message-ID: <20200930072542.GC13876@Asurada-Nvidia>
References: <20200930003013.31289-1-nicoleotsuka@gmail.com>
 <20200930003013.31289-2-nicoleotsuka@gmail.com>
 <CAJKOXPeye7b0j1oB21JmBwc277_1RYWQ0SC0Otf+F62HK=sjjA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJKOXPeye7b0j1oB21JmBwc277_1RYWQ0SC0Otf+F62HK=sjjA@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 iommu@lists.linux-foundation.org, jonathanh@nvidia.com,
 thierry.reding@gmail.com, linux-tegra@vger.kernel.org, digetx@gmail.com
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

Hi Krzysztof,

On Wed, Sep 30, 2020 at 09:21:39AM +0200, Krzysztof Kozlowski wrote:
> On Wed, 30 Sep 2020 at 02:35, Nicolin Chen <nicoleotsuka@gmail.com> wrote:
> >
> > This can be used by both tegra-smmu and tegra20-devfreq drivers.
> >
> > Suggested-by: Dmitry Osipenko <digetx@gmail.com>
> > Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
> > ---
> >
> > Changelog
> > v1->v2
> >  * N/A
> >
> >  drivers/memory/tegra/mc.c | 23 +++++++++++++++++++++++
> >  include/soc/tegra/mc.h    |  1 +
> >  2 files changed, 24 insertions(+)
> >
> > diff --git a/drivers/memory/tegra/mc.c b/drivers/memory/tegra/mc.c
> > index ec8403557ed4..09352ad66dcc 100644
> > --- a/drivers/memory/tegra/mc.c
> > +++ b/drivers/memory/tegra/mc.c
> > @@ -42,6 +42,29 @@ static const struct of_device_id tegra_mc_of_match[] = {
> >  };
> >  MODULE_DEVICE_TABLE(of, tegra_mc_of_match);
> 
> > +struct tegra_mc *tegra_get_memory_controller(void)
> > +{
> 
> Add kerneldoc and mention dropping of reference to the device after use.

I am abort to use Dmitry's devm_ one in my next version:
https://github.com/grate-driver/linux/commit/2105e7664063772d72fefe9696bdab0b688b9de2

Could I just skip the kerneldoc part? Otherwise, would you please
tell me which kerneldoc file I should update?

Thanks
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
