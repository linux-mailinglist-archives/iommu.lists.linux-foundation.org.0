Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 467DC1719DF
	for <lists.iommu@lfdr.de>; Thu, 27 Feb 2020 14:48:54 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id E91B787EC4;
	Thu, 27 Feb 2020 13:48:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eHGMLQqaWoKB; Thu, 27 Feb 2020 13:48:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 3E18987EBF;
	Thu, 27 Feb 2020 13:48:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EB745C1D8E;
	Thu, 27 Feb 2020 13:48:51 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DE899C0177
 for <iommu@lists.linux-foundation.org>; Thu, 27 Feb 2020 13:48:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id DB446855E1
 for <iommu@lists.linux-foundation.org>; Thu, 27 Feb 2020 13:48:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j1ZyDjrF9Tra for <iommu@lists.linux-foundation.org>;
 Thu, 27 Feb 2020 13:48:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 796B0815EC
 for <iommu@lists.linux-foundation.org>; Thu, 27 Feb 2020 13:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PoSSrrOhLZRKsDeBPtoUsTXsqq0/3S5EgT3W2cvMuRM=; b=p5oilUvw62zko+smzaMn3nz33
 Fumo53LyeevEHRRm1Is/MUXxwpsYNT4BGuU5758qoYYXIg1z6GDCNSVV0h1cg6nMke473/0KUwBhy
 Rz8w26TEGwGBPnRGfy89pSkqZ3+IxzPNX8Mk3oFEz0L8a2zdWUCM4vTYJxmX+9IP+dKFOqv+AQHIW
 RM5h+DHub6tVsjZAf2jI+h47XQrhOJATtkjiPjfadx08ueW/GU6MZpAFUNXnxgLF5ucJZF1OcTj8w
 fILswtXC6Tf6ApFCHSO8kS19EDyM8qr5htWVwxbIJiJrGovAnWXmbWAyWJSsLDa0fUEiygtEQDvNP
 Dd/LgW8MA==;
Received: from shell.armlinux.org.uk
 ([2001:4d48:ad52:3201:5054:ff:fe00:4ec]:45980)
 by pandora.armlinux.org.uk with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <linux@armlinux.org.uk>)
 id 1j7JWs-0005sw-MW; Thu, 27 Feb 2020 13:48:42 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1j7JWp-00011V-Ga; Thu, 27 Feb 2020 13:48:39 +0000
Date: Thu, 27 Feb 2020 13:48:39 +0000
From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH] iommu: silence iommu group prints
Message-ID: <20200227134839.GL25745@shell.armlinux.org.uk>
References: <E1j7Hnc-0004Bm-Kn@rmk-PC.armlinux.org.uk>
 <2b86add2-03aa-21f1-c58a-120a8394e6eb@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2b86add2-03aa-21f1-c58a-120a8394e6eb@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: iommu@lists.linux-foundation.org
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

On Thu, Feb 27, 2020 at 01:44:56PM +0000, Robin Murphy wrote:
> On 27/02/2020 11:57 am, Russell King wrote:
> > On the LX2160A, there are lots (about 160) of IOMMU messages produced
> > during boot; this is excessive.  Reduce the severity of these messages
> > to debug level.
> 
> That's... a lot. Does the system really have that many devices, or is some
> driver being stupid and repeatedly populating and destroying an entire bus
> in a probe-deferral dance?

It's all the devices created by for the mc-bus for the DPAA2
networking support.  I don't know the technicalities, just that
the boot is spammed with these messages.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
According to speedtest.net: 11.9Mbps down 500kbps up
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
