Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CD4727E061
	for <lists.iommu@lfdr.de>; Wed, 30 Sep 2020 07:33:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id AB95385B6F;
	Wed, 30 Sep 2020 05:33:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AzSf5zRaRmi6; Wed, 30 Sep 2020 05:33:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id EA9FF85620;
	Wed, 30 Sep 2020 05:33:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CD794C0051;
	Wed, 30 Sep 2020 05:33:35 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 99C1CC0051
 for <iommu@lists.linux-foundation.org>; Wed, 30 Sep 2020 05:33:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 7EE03844C2
 for <iommu@lists.linux-foundation.org>; Wed, 30 Sep 2020 05:33:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jQlaVzqkWeVi for <iommu@lists.linux-foundation.org>;
 Wed, 30 Sep 2020 05:33:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
 [209.85.216.67])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id EF415844B4
 for <iommu@lists.linux-foundation.org>; Wed, 30 Sep 2020 05:33:32 +0000 (UTC)
Received: by mail-pj1-f67.google.com with SMTP id md22so380331pjb.0
 for <iommu@lists.linux-foundation.org>; Tue, 29 Sep 2020 22:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=OmxpJuvijh0m6kJcF1u1drddAJ2BLcjqzo+pucKDFhY=;
 b=nqp4vmkdnFydbbSm+m0QjFWfBzAsAjfdi8rm2h2f9jz87VU+oto3pBdY71rBrklkGt
 E63lSJUmcKNwPNVphQNlnwwrM++BWwXMYn0IkCrBOAW74ef/WgDFGjLRonwlofMxesji
 xajr0wGt+ED8HcxXD9WpGvmx093Vj7nxAtzFSEtmDrZ0x+tmdwbsUMxCTn/97F3KesOn
 PnPPaNTSXPRs6iqleYiJ6dGgOIVbrKV3uV0rgmO/gWhf7qsaflm8bUZIQqHWZ3naNAxf
 aFJMSpDAEVGBaEDlA5/u1fK2YYdHOOVfZRsEAu6Lxx6l6iyRuBzHHkQksRuCc2Ka7FaG
 BiPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=OmxpJuvijh0m6kJcF1u1drddAJ2BLcjqzo+pucKDFhY=;
 b=mpTvJQuwR32teEzzPMcfntwzDkJHH9JUHJNBpCHxVy4WfMUGMyftg89IutDrATx0Qa
 QBSHlz7g4UQ1KFa+5aNpANT95J/upCoUDizo14+3cWx68SbXy0eZIrzjG1N5BUwaiFKX
 +G4HegHCUWD/wgtcrYXD66pSAFxuPOIG6AaHpJ2DmPLjKxtaQW3MLx0EhojxKOZx5n5x
 IjUm4S5xur3e0GHhOk6RtqVoks2RgcZWLTYg8AH+X/o2nczkSVJmVjX9pCb1dovrsz5I
 MhKaaAVBNeFv5Ex7NyWQdJMFZNmM6t969HjYioB4l/PE0wMA32ITeU46a+5g861KVzKr
 Oa8Q==
X-Gm-Message-State: AOAM533KIXfn/WaiWnW3x3VUPIvdMIKLfgqQBRp56MS1QMQEiQiFY3TU
 eQ/Z62Ee5sl4d8SSkMH9+qg=
X-Google-Smtp-Source: ABdhPJz8999KVOIETNd5trWMtQBQibv12Knp50lGI0K0vTSJfuEJs2akAi00z6JP0DZT/qRZNRdhAA==
X-Received: by 2002:a17:90a:8d05:: with SMTP id
 c5mr994931pjo.222.1601444012558; 
 Tue, 29 Sep 2020 22:33:32 -0700 (PDT)
Received: from Asurada-Nvidia (thunderhill.nvidia.com. [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id c1sm648658pfj.219.2020.09.29.22.33.31
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 29 Sep 2020 22:33:32 -0700 (PDT)
Date: Tue, 29 Sep 2020 22:28:00 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v2 3/3] iommu/tegra-smmu: Add PCI support
Message-ID: <20200930052759.GA31821@Asurada-Nvidia>
References: <20200930003013.31289-1-nicoleotsuka@gmail.com>
 <20200930003013.31289-4-nicoleotsuka@gmail.com>
 <27b155ec-97ab-98f6-7b48-3fded875d5cc@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <27b155ec-97ab-98f6-7b48-3fded875d5cc@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 krzk@kernel.org, jonathanh@nvidia.com, thierry.reding@gmail.com,
 linux-tegra@vger.kernel.org
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

T24gV2VkLCBTZXAgMzAsIDIwMjAgYXQgMDg6MTA6MDBBTSArMDMwMCwgRG1pdHJ5IE9zaXBlbmtv
IHdyb3RlOgo+IDMwLjA5LjIwMjAgMDM6MzAsIE5pY29saW4gQ2hlbiDQv9C40YjQtdGCOgo+IC4u
Lgo+ID4gKyNpZmRlZiBDT05GSUdfUENJCj4gPiArCWlmICghaW9tbXVfcHJlc2VudCgmcGNpX2J1
c190eXBlKSkgewo+IAo+IENvdWxkIHlvdSBwbGVhc2UgZXhwbGFpbiB3aHkgdGhpcyBjaGVjayBp
cyBuZWVkZWQ/CgpUaGF0J3MgcmVmZXJlbmNpbmcgd2hhdCdzIGluIHRoZSBhcm0tc21tdS5jIGZp
bGUsIHNpbmNlIGl0IGRvZXMKbm90IGh1cnQgdG8gaGF2ZSBhIGNoZWNrLgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppb21tdSBtYWlsaW5nIGxpc3QKaW9t
bXVAbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRp
b24ub3JnL21haWxtYW4vbGlzdGluZm8vaW9tbXU=
