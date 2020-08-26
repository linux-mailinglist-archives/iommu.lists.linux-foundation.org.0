Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 10DF1252ACB
	for <lists.iommu@lfdr.de>; Wed, 26 Aug 2020 11:53:24 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id ABFA387E9D;
	Wed, 26 Aug 2020 09:53:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q63D9AVUS5Qi; Wed, 26 Aug 2020 09:53:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 628DD87E99;
	Wed, 26 Aug 2020 09:53:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 41044C0051;
	Wed, 26 Aug 2020 09:53:21 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C30D8C0051
 for <iommu@lists.linux-foundation.org>; Wed, 26 Aug 2020 09:53:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id BE9E586C34
 for <iommu@lists.linux-foundation.org>; Wed, 26 Aug 2020 09:53:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 516rE9S7ZuEH for <iommu@lists.linux-foundation.org>;
 Wed, 26 Aug 2020 09:53:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 1CFB886C1A
 for <iommu@lists.linux-foundation.org>; Wed, 26 Aug 2020 09:53:19 +0000 (UTC)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1598435595;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mv4TqayOvYT1PZy4IB6XdyAxCqLJFuyrG/iBXdVvDGo=;
 b=gry5Gqjf5XbHVcJKaDXMPK4boPx5u/IEBob5D9Wn36xeFWifKRFQGrLYl80/EuQiMfzysE
 R0d4KWtrjVjHsKfDbzzjWDT5squtWA8CAJmXu6ssTTvFAl1Dp0Qb/5Gseu91lYmL0/YUjO
 NbsGg1x1qsfcwMmq40s6f8QzME/wE8mMh0jkO28671y+OSXzdMJAa+d/pRnJ+IIBJUer6F
 myfzP6CTQbmP/AgP0sGex0XapaKloSSKztkVFL6Agugb80R0gctiC6HeZ9PqzrabjLNIkQ
 pAIkMvt8UaWwzx1EMmCW7rVmlO3SHuNH8U5WRqRwrLaG8IAQqyASWZnve1tyYQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1598435595;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mv4TqayOvYT1PZy4IB6XdyAxCqLJFuyrG/iBXdVvDGo=;
 b=T18EHlogGsekmXEOkS3bdJRDQU5OgZArZ4psx/80SWGB5Jkvh72YqFLOhYbYkZrSz/1STi
 ppR6UR793IwPtlAg==
To: Boqun Feng <boqun.feng@gmail.com>
Subject: Re: [patch RFC 10/38] x86/ioapic: Consolidate IOAPIC allocation
In-Reply-To: <20200826084019.GA6174@debian-boqun.qqnc3lrjykvubdpftowmye0fmh.lx.internal.cloudapp.net>
References: <20200821002424.119492231@linutronix.de>
 <20200821002946.297823391@linutronix.de>
 <20200826084019.GA6174@debian-boqun.qqnc3lrjykvubdpftowmye0fmh.lx.internal.cloudapp.net>
Date: Wed, 26 Aug 2020 11:53:15 +0200
Message-ID: <871rjtwx6c.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Cc: Dimitri Sivanich <sivanich@hpe.com>, linux-hyperv@vger.kernel.org,
 Steve Wahl <steve.wahl@hpe.com>, linux-pci@vger.kernel.org,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Dan Williams <dan.j.williams@intel.com>, Wei Liu <wei.liu@kernel.org>,
 Stephen Hemminger <sthemmin@microsoft.com>, Baolu Lu <baolu.lu@intel.com>,
 Marc Zyngier <maz@kernel.org>, x86@kernel.org,
 Jason Gunthorpe <jgg@mellanox.com>, Megha Dey <megha.dey@intel.com>,
 xen-devel@lists.xenproject.org, Kevin Tian <kevin.tian@intel.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Dave Jiang <dave.jiang@intel.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Jon Derrick <jonathan.derrick@intel.com>, Juergen Gross <jgross@suse.com>,
 Russ Anderson <rja@hpe.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>, iommu@lists.linux-foundation.org,
 Jacob Pan <jacob.jun.pan@intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>
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

T24gV2VkLCBBdWcgMjYgMjAyMCBhdCAxNjo0MCwgQm9xdW4gRmVuZyB3cm90ZToKPiBJIGhpdCBh
IGNvbXBpbGVyIGVycm9yIHdoaWxlIEkgd2FzIHRyeWluZyB0byBjb21waWxlIHRoaXMgcGF0Y2hz
ZXQ6Cj4KPiBhcmNoL3g4Ni9rZXJuZWwvZGV2aWNldHJlZS5jOiBJbiBmdW5jdGlvbiDigJhkdF9p
cnFkb21haW5fYWxsb2PigJk6Cj4gYXJjaC94ODYva2VybmVsL2RldmljZXRyZWUuYzoyMzI6Njog
ZXJyb3I6IOKAmHN0cnVjdCBpcnFfYWxsb2NfaW5mb+KAmSBoYXMgbm8gbWVtYmVyIG5hbWVkIOKA
mGlvYXBpY19pZOKAmTsgZGlkIHlvdSBtZWFuIOKAmGlvYXBpY+KAmT8KPiAgIDIzMiB8ICB0bXAu
aW9hcGljX2lkID0gbXBjX2lvYXBpY19pZChtcF9pcnFkb21haW5faW9hcGljX2lkeChkb21haW4p
KTsKClllYWgsIG5vdGljZWQgbXlzZWxmIGFscmVhZHkgYW5kIDBkYXkgY29tcGxhaW5lZCBhcyB3
ZWxsIDopCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpp
b21tdSBtYWlsaW5nIGxpc3QKaW9tbXVAbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6
Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vaW9tbXU=
