Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E750284395
	for <lists.iommu@lfdr.de>; Tue,  6 Oct 2020 03:00:53 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 26BE7204AA;
	Tue,  6 Oct 2020 01:00:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Nmo+hRPzZiof; Tue,  6 Oct 2020 01:00:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 7289C20445;
	Tue,  6 Oct 2020 01:00:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4DB29C0051;
	Tue,  6 Oct 2020 01:00:51 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6E105C0051
 for <iommu@lists.linux-foundation.org>; Tue,  6 Oct 2020 01:00:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 51642857A3
 for <iommu@lists.linux-foundation.org>; Tue,  6 Oct 2020 01:00:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wulbkzflXM4S for <iommu@lists.linux-foundation.org>;
 Tue,  6 Oct 2020 01:00:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 18B408577F
 for <iommu@lists.linux-foundation.org>; Tue,  6 Oct 2020 01:00:49 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id o9so378900plx.10
 for <iommu@lists.linux-foundation.org>; Mon, 05 Oct 2020 18:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ULovZDh4nNXnrhAmYDekggZ1SAII9f678l5WRSniMjQ=;
 b=tT2/p9kkQck2bPx0f4E5gQd74HIXbZmZcy2pFDMGyPLhRXmy2wbiGliiPX7/s0eYIX
 Cu1p6oHsFYVAsEWt8c6zCG9P8iWrZHL4zue7+eSo67dvcqYXtOu1sLmdH8TypU9rx7zR
 1WTDLkQA2Zgqgy2XeqxsLBamJzJ9OXA/f7qvB4ptUL8EBzA8oY47z2gYY6D9X0mLv0ln
 /keIq/rxiTYe5wdCkRor4AHg9wyoHuznv7VHMCMt2LUvnN69qhUn40TNg/M9sy4nAKXH
 QxfnNeyEjWXT1nY9SGDDYAR9fiuokOgj6W3ypq+yX/ZRHgaSs6FeXhANWU0rNEuZCZTL
 pN3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ULovZDh4nNXnrhAmYDekggZ1SAII9f678l5WRSniMjQ=;
 b=PDEOFousV1g87AF5aPEpkQ3YCJiIEOTmBpvwyGHnT50YrmAczGLQbcmh4JLrBZe6V/
 M+8hYlCF8ELH78vfVRI4Zd77Ga0ruzPMVSpc6vk6U9TNCcXqnZmGmZhTL5h5R+dy9ar/
 NsidQwnN1Yhk8gZMsVCEnSEpYBL/hk0MdIrp1zI7ynYLtBJsWgvZ9d/kh4gcryWPZptU
 UhB73s7qF3AKXkdCVtEfus42JGzt5lKDymqSHSpPkn3wIgkLeM6b5k2GLBNj7ReCpqQ+
 hFHe8DqdSZ6wb0VYnU1fkMGkCJMV7r8tc5210O2MaXXniVNWPpW3ENuodMwPl7Znpg7g
 EFbA==
X-Gm-Message-State: AOAM530/JHPnN9gYghdYjAEjN9OQFYfXqYdPIkeG+tvGtHmsvv8UuoUI
 S3Nhx8zoTrOsSNsHEsF56NQ=
X-Google-Smtp-Source: ABdhPJzIKzYvGywr9Xvoc+MvkW9hchVKOfUbteeoYw0WFYR6RIRBJDmZRDRkTuoxEOWd9qbYFOe+yQ==
X-Received: by 2002:a17:902:eeca:b029:d3:d8dd:3e4b with SMTP id
 h10-20020a170902eecab02900d3d8dd3e4bmr1030261plb.68.1601946048616; 
 Mon, 05 Oct 2020 18:00:48 -0700 (PDT)
Received: from Asurada-Nvidia (thunderhill.nvidia.com. [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id cs21sm3278844pjb.0.2020.10.05.18.00.48
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 05 Oct 2020 18:00:48 -0700 (PDT)
Date: Mon, 5 Oct 2020 17:54:14 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v4 3/3] iommu/tegra-smmu: Add PCI support
Message-ID: <20201006005414.GA28640@Asurada-Nvidia>
References: <20201002060807.32138-1-nicoleotsuka@gmail.com>
 <20201002060807.32138-4-nicoleotsuka@gmail.com>
 <20201005100419.GK425362@ulmo>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201005100419.GK425362@ulmo>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 jonathanh@nvidia.com, linux-tegra@vger.kernel.org, digetx@gmail.com
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

On Mon, Oct 05, 2020 at 12:04:19PM +0200, Thierry Reding wrote:
> > +err_bus_set: __maybe_unused;
> > +	bus_set_iommu(&platform_bus_type, NULL);
> > +err_unregister:
> > +	iommu_device_unregister(&smmu->iommu);
> > +err_sysfs:
> > +	iommu_device_sysfs_remove(&smmu->iommu);
> 
> Can you please switch to label names that are more consistent with the
> others in this driver? Notably the ones in tegra_smmu_domain_alloc().
> The idea is to describe in the name of the label what's happening at the
> label. Something like this, for example:
> 
> unset_platform_bus:
> 	bus_set_iommu(&platform_bus_type, NULL);
> unregister:
> 	iommu_device_unregister(&smmu->iommu);
> remove_sysfs:
> 	iommu_device_sysfs_remove(&smmu->iommu);

Okay. Will update in v7.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
