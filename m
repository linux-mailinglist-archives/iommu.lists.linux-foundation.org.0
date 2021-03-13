Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id C89AE33A1C3
	for <lists.iommu@lfdr.de>; Sat, 13 Mar 2021 23:54:31 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0F12640135;
	Sat, 13 Mar 2021 22:54:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fZCJUE3RNBkp; Sat, 13 Mar 2021 22:54:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTP id A80DF4310C;
	Sat, 13 Mar 2021 22:54:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7CD21C0012;
	Sat, 13 Mar 2021 22:54:19 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 96E00C0001
 for <iommu@lists.linux-foundation.org>; Sat, 13 Mar 2021 22:54:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7DBE24EC44
 for <iommu@lists.linux-foundation.org>; Sat, 13 Mar 2021 22:54:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X1oX5jDdmKxz for <iommu@lists.linux-foundation.org>;
 Sat, 13 Mar 2021 22:54:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 586C34542E
 for <iommu@lists.linux-foundation.org>; Sat, 13 Mar 2021 22:54:16 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id ha17so6165618pjb.2
 for <iommu@lists.linux-foundation.org>; Sat, 13 Mar 2021 14:54:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ZeQpfKGikM556gB312kKuWrZWMdYA+ch/LZuyQT8OHk=;
 b=Id27IwZD3Ma6UhBAhLw0/YI2T2aivdYncTisogUPgE8BfvcVqm0Bu1tHUIlkVa65Dd
 EFbZOcNYK9EA7iVE4NuajCxa18r0Yra2Q6r4ufGugGCbx6AregeCKThvgJUyzM1sSxo3
 Ean/kUTHHtm5mRmZ4vekDBycT+u3r2Nya2UMgYJWQNnmCbkgwTRFpYqXXu1sW1rsTmb+
 8Gm983leCcS/FvwiH1coThkX5LLWCiIAGdlDfw46l8w7Pdez9YtCekixZyG4oSI/HqnE
 zQZDzZb42wQBvSbWoPnlCdOJS0kytfU6plIHZ+R6Y7laK1nUKB3joVZ1C3mhc+bqdVF1
 CVlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ZeQpfKGikM556gB312kKuWrZWMdYA+ch/LZuyQT8OHk=;
 b=iOCdimuq1T8F65xeXeNcbFJDIl4fx2kM3ua+qDlXtzUuv/fXRCp4wkv+zRI80VUMIz
 V8gAm9lFzpZf2WQaIQA0SVR24XQMCMVWFKQIEoRQZSTfAO9CCbRtC/LgxYtxNPidH3Aw
 W7mKPhdHaN+09CG+10RLdYBHOkd7+K/dUlJc0gubsNdJ7b892xzNg5r/0OCuW7l5JgJI
 uFRpb/u0jMEEjtKgPj1tRU//syuIZ8Ulw0n+nmoQHyLlbns3Rt8YZQ7JNLi7WKR4Q6Yx
 0Eg3q373YqLjLSCQE4WoHX8P5232a2TAGch3vSXu5iM3Upo9B5o5VnPRPlzS/S4Ex9BK
 KcNA==
X-Gm-Message-State: AOAM532dqTZdEfTYgcX1L6YsKuMXMD+nbomK1EFZiGqOk4r6mP9SGKur
 ocHEa2UnRjR8x6SFXq90OeQ=
X-Google-Smtp-Source: ABdhPJxR84SoyhWXQcST6ZnPVDKAV8GImHbNh21zVWQYvUvEVGxbpfSU7ZSLBVBEzhDd7SLl2iE2Jg==
X-Received: by 2002:a17:902:6bca:b029:e2:c5d6:973e with SMTP id
 m10-20020a1709026bcab02900e2c5d6973emr4890259plt.40.1615676055681; 
 Sat, 13 Mar 2021 14:54:15 -0800 (PST)
Received: from Asurada-Nvidia (thunderhill.nvidia.com. [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id n9sm5865620pjq.38.2021.03.13.14.54.14
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 13 Mar 2021 14:54:15 -0800 (PST)
Date: Sat, 13 Mar 2021 14:52:00 -0800
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1] iommu/tegra-smmu: Make tegra_smmu_probe_device() to
 handle all IOMMU phandles
Message-ID: <20210313225159.GA11402@Asurada-Nvidia>
References: <20210312155439.18477-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210312155439.18477-1-digetx@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org,
 Will Deacon <will@kernel.org>
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

On Fri, Mar 12, 2021 at 06:54:39PM +0300, Dmitry Osipenko wrote:
> The tegra_smmu_probe_device() handles only the first IOMMU device-tree
> phandle, skipping the rest. Devices like 3D module on Tegra30 have
> multiple IOMMU phandles, one for each h/w block, and thus, only one
> IOMMU phandle is added to fwspec for the 3D module, breaking GPU.
> Previously this problem was masked by tegra_smmu_attach_dev() which
> didn't use the fwspec, but parsed the DT by itself. The previous commit
> to tegra-smmu driver partially reverted changes that caused problems for
> T124 and now we have tegra_smmu_attach_dev() that uses the fwspec and
> the old-buggy variant of tegra_smmu_probe_device() which skips secondary
> IOMMUs.
> 
> Make tegra_smmu_probe_device() not to skip the secondary IOMMUs. This
> fixes a partially attached IOMMU of the 3D module on Tegra30 and now GPU
> works properly once again.
> 
> Fixes: 765a9d1d02b2 ("iommu/tegra-smmu: Fix mc errors on tegra124-nyan")
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>

Tested-by: Nicolin Chen <nicoleotsuka@gmail.com>
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
