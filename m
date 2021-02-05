Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B024310478
	for <lists.iommu@lfdr.de>; Fri,  5 Feb 2021 06:23:49 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 325502E0EB;
	Fri,  5 Feb 2021 05:23:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cr1VxlGCG9km; Fri,  5 Feb 2021 05:23:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 99E62274E3;
	Fri,  5 Feb 2021 05:23:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8462BC1834;
	Fri,  5 Feb 2021 05:23:45 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 96F10C013A
 for <iommu@lists.linux-foundation.org>; Fri,  5 Feb 2021 05:23:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 7AC8F85C90
 for <iommu@lists.linux-foundation.org>; Fri,  5 Feb 2021 05:23:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nnwsLTLV2nX1 for <iommu@lists.linux-foundation.org>;
 Fri,  5 Feb 2021 05:23:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by whitealder.osuosl.org (Postfix) with ESMTPS id E3D7C85ADB
 for <iommu@lists.linux-foundation.org>; Fri,  5 Feb 2021 05:23:43 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id l18so3152635pji.3
 for <iommu@lists.linux-foundation.org>; Thu, 04 Feb 2021 21:23:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=sfENSTnpSvaaqxS0nyqOketbMxXz6Eoy2Sb6irXF6Ww=;
 b=QpQYF0aU1rxGPUixZZamHAnkD9B21kAa/09eNDGJnYGTxHOwckNTo4aBK1egPOlLmX
 e0wnjFUq1j9MS7x0pL36qJgiPJkky+XwmQUktHLLKR5cK/xHJPcFn1wg2TX4xme62YhI
 5hUvGsm0OkVNrpLD+SjuQDoIxeqLnknV0MvGRAh8P7C8PbwJ7UQ2KHPhlCCmc0c7oIlE
 xmITs7GqMtTsaK4xAqdD1/pjml3GifmzQ9YfvFyBgy/0+Bc/VVCGmPxIuYcwM0i37udy
 HgyqdUwwERQoWIM1/F2rLg8Uq3ugCUJGMDm3vq5xp9eQepnhIY7aZlu5vnTiWQcXHV/O
 3Ung==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=sfENSTnpSvaaqxS0nyqOketbMxXz6Eoy2Sb6irXF6Ww=;
 b=oV/8GosvWv7u+uj5hEE1pE9CLNAOKSkzgarrdFM/dKMPeLjGB+1RVp76Upjn0yz43Q
 EZYFZurZ0sc8k1W6h3v5AlucvNCJuPyp0JF84achE8YHeGM0zMNgjkMhXcFlqZynkG8+
 OxnVgUmmej43XsKF2xxHf2X0n+Cvd3ccYFSJODl+VS2Jr8F8D7CLtPkskiff9rH3gFom
 33OT9ViyIPMqnIQQJyVRcmTTHjq/03yhUwFxOGMJBDYSRRFJPmFwDUcZMV1lYfHD7IjP
 iInCCDboIP53G6HKDrNyQh5TzduM5m1Pi7HGxnq7R5aszVPQK3i5spBRy6g1TOmW4oEO
 Rmtg==
X-Gm-Message-State: AOAM531qFWvhy5edwksDXuZFacaZfYaARI7izG2se5yqd3nWYXkGv8xY
 Bc5YoY1zpFQyVwdP2pm+8dw=
X-Google-Smtp-Source: ABdhPJyCHSZ3KR2xex3trBm5CIiMra/bpXGjzKbC+RDrfpbh/w8A2mGfeQjgetzChiucOyaDkDioyg==
X-Received: by 2002:a17:902:d886:b029:e1:7784:4db5 with SMTP id
 b6-20020a170902d886b02900e177844db5mr2612899plz.72.1612502623404; 
 Thu, 04 Feb 2021 21:23:43 -0800 (PST)
Received: from Asurada-Nvidia (thunderhill.nvidia.com. [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id z184sm4470833pfz.157.2021.02.04.21.23.42
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 04 Feb 2021 21:23:42 -0800 (PST)
Date: Thu, 4 Feb 2021 21:24:23 -0800
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Guillaume Tucker <guillaume.tucker@collabora.com>
Subject: Re: [PATCH RESEND v2 4/5] iommu/tegra-smmu: Rework
 tegra_smmu_probe_device()
Message-ID: <20210205052422.GA11329@Asurada-Nvidia>
References: <20201125101013.14953-1-nicoleotsuka@gmail.com>
 <20201125101013.14953-5-nicoleotsuka@gmail.com>
 <46a96cf9-91cc-2ad4-702a-e95ba7200375@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <46a96cf9-91cc-2ad4-702a-e95ba7200375@collabora.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: "kernelci-results@groups.io" <kernelci-results@groups.io>,
 linux-kernel@vger.kernel.org, jonathanh@nvidia.com,
 iommu@lists.linux-foundation.org, thierry.reding@gmail.com,
 linux-tegra@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>,
 kernel@collabora.com, will@kernel.org
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

Hi Guillaume,

On Thu, Feb 04, 2021 at 11:10:15AM +0000, Guillaume Tucker wrote:
> Hi Nicolin,
> 
> A regression was detected by kernelci.org in IGT's drm_read tests
> on mainline, it was first seen on 17th December 2020.  You can
> find some details here:
> 
>   https://kernelci.org/test/case/id/600b82dc1e3208f123d3dffc/

Thanks for reporting the issue. We did test on Tegra210 and Tegra30
yet not on Tegra124. I am wondering what could go wrong...

> Please let us know if you need any help debugging this issue or
> to try a fix on this platform.

Yes, I don't have any Tegra124 platform to run. It'd be very nice
if you can run some debugging patch (I can provide you) and a fix
after I root cause the issue.

Thanks
Nicolin
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
