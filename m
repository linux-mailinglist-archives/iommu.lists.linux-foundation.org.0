Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 7377E10A56E
	for <lists.iommu@lfdr.de>; Tue, 26 Nov 2019 21:28:34 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 2DA5388072;
	Tue, 26 Nov 2019 20:28:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U75xDszRDvEE; Tue, 26 Nov 2019 20:28:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 203E888046;
	Tue, 26 Nov 2019 20:28:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 06C15C0878;
	Tue, 26 Nov 2019 20:28:32 +0000 (UTC)
X-Original-To: iommu@lists.linuxfoundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 84745C0878
 for <iommu@lists.linuxfoundation.org>; Tue, 26 Nov 2019 20:28:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 7E0CF86ACB
 for <iommu@lists.linuxfoundation.org>; Tue, 26 Nov 2019 20:28:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MfEeXDSPeLpZ for <iommu@lists.linuxfoundation.org>;
 Tue, 26 Nov 2019 20:28:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
 [209.85.167.195])
 by whitealder.osuosl.org (Postfix) with ESMTPS id CBBDB8637D
 for <iommu@lists.linuxfoundation.org>; Tue, 26 Nov 2019 20:28:29 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id s71so17879847oih.11
 for <iommu@lists.linuxfoundation.org>; Tue, 26 Nov 2019 12:28:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/XSZa4W/M2aE/Tb/1KifHz0unDdEO/TbPc4sPZEojwc=;
 b=CBhYcMifwObV8FiaLv3qnDm8tmxQesbOiKmpfYuLwQcoURmaoskF1BM3VvvuJsOxEg
 FeS4PEx1RfrQfekKtivjkgF7pV4uIh0nmFJIkzU+WBK1uEM80zbJa80xMaETFFZjGlva
 4jz3NvIlnC3RdVDU0YgJOoe+Ksz95PefmhbLQK2Er0F5wZZXWu1YtF8I64NxENNF3vG9
 f4F3WKam+EMzAwKbkar25ZPTlk/l3cK0HaHyZUbAJsyZaSckG4r44N/f88GEKvx4k8NE
 Kxv+bW0pCp6LKZVFQriQBDAFdj6bVkWKsjR52Mu1HC/KAImOfK+rNMbhfqVdA2byccjd
 3KLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/XSZa4W/M2aE/Tb/1KifHz0unDdEO/TbPc4sPZEojwc=;
 b=Bolx/MxTBOB3dFK3lu5K94CCHMHFCoMDhcno0nBzzGXZzz2IpSgy0caRojlHaGjtaP
 TFwgD5kyPJjYSY9PPgnsCBXbjDMRYgXEK3tPbR21XZ2Ru2ZvGTnFz6usM3tlgANmEWMN
 vuRiNEjoD9/eyVXpIbzRSYJfUqcLcarWM4Sxt/PZJPK7LLvUCHCrzyCWXNsAPWpkPpYz
 xOdPSssp57smkuO5uW0jOUJn/Gt0UqKsxp1+27ESOYMmZBerw3c748XjzN9YTvxCBSF7
 r9m+9OZx7yA5srk2n2oGdb4Af64mm3Kdz5Ups3HiGLlfZLQrcUofWC0Ww1+irncj1SXS
 AxYA==
X-Gm-Message-State: APjAAAVq/718iQPoEWkDo8wupyU7gphJBSG6IC9YOOkbuJ3xPtI5WZU5
 ATXrkJX3YT3koHi32gj+wzK5W8A9wtWpFheEKotjDQ==
X-Google-Smtp-Source: APXvYqwYoqI9ebTNGSoRQFaPjS4xFGjozMV1PMYVPuvzl4n6+yfP1MFkD0UBucO5QOZTVwhOiGWpwNsqbdfl5iQJkQ4=
X-Received: by 2002:a05:6808:611:: with SMTP id
 y17mr814072oih.24.1574800108635; 
 Tue, 26 Nov 2019 12:28:28 -0800 (PST)
MIME-Version: 1.0
References: <20191121114918.2293-1-will@kernel.org>
 <20191121114918.2293-10-will@kernel.org>
 <5c91d467-5e59-482b-8f4f-e0cfa3db9028@huawei.com>
In-Reply-To: <5c91d467-5e59-482b-8f4f-e0cfa3db9028@huawei.com>
Date: Tue, 26 Nov 2019 12:27:52 -0800
Message-ID: <CAGETcx8Hkta6scFdiG=eQypsQ--jrR1YisaOQATCbMiu+aG8sg@mail.gmail.com>
Subject: Re: [PATCH v3 09/14] iommu/arm-smmu: Prevent forced unbinding of Arm
 SMMU drivers
To: John Garry <john.garry@huawei.com>
Cc: iommu@lists.linuxfoundation.org,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Will Deacon <will@kernel.org>, "Isaac J. Manjarres" <isaacm@codeaurora.org>,
 Robin Murphy <robin.murphy@arm.com>
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
From: Saravana Kannan via iommu <iommu@lists.linux-foundation.org>
Reply-To: Saravana Kannan <saravanak@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On Tue, Nov 26, 2019 at 1:13 AM John Garry <john.garry@huawei.com> wrote:
>
> On 21/11/2019 11:49, Will Deacon wrote:
> > Forcefully unbinding the Arm SMMU drivers is a pretty dangerous operation,
> > since it will likely lead to catastrophic failure for any DMA devices
> > mastering through the SMMU being unbound. When the driver then attempts
> > to "handle" the fatal faults, it's very easy to trip over dead data
> > structures, leading to use-after-free.
> >
> > On John's machine, he reports that the machine was "unusable" due to
> > loss of the storage controller following a forced unbind of the SMMUv3
> > driver:
> >
> >    | # cd ./bus/platform/drivers/arm-smmu-v3
> >    | # echo arm-smmu-v3.0.auto > unbind
> >    | hisi_sas_v2_hw HISI0162:01: CQE_AXI_W_ERR (0x800) found!
> >    | platform arm-smmu-v3.0.auto: CMD_SYNC timeout at 0x00000146
> >    | [hwprod 0x00000146, hwcons 0x00000000]
> >
> > Prevent this forced unbinding of the drivers by setting "suppress_bind_attrs"
> > to true.
>
> This seems a reasonable approach for now.
>
> BTW, I'll give this series a spin this week, which again looks to be
> your iommu/module branch, excluding the new IORT patch.

Is this on a platform where of_devlink creates device links between
the iommu device and its suppliers? I'm guessing no? Because device
links should for unbinding of all the consumers before unbinding the
supplier.

Looks like it'll still allow the supplier to unbind if the consumers
don't allow unbinding. Is that the case here?

-Saravana
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
