Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 2951029305A
	for <lists.iommu@lfdr.de>; Mon, 19 Oct 2020 23:16:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id E3AC587126;
	Mon, 19 Oct 2020 21:16:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V26IL+-sF4+U; Mon, 19 Oct 2020 21:16:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 61F5F87152;
	Mon, 19 Oct 2020 21:16:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4025DC1AD7;
	Mon, 19 Oct 2020 21:16:18 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 988F7C0051
 for <iommu@lists.linux-foundation.org>; Mon, 19 Oct 2020 21:16:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 93ED58714E
 for <iommu@lists.linux-foundation.org>; Mon, 19 Oct 2020 21:16:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qjRUTJKc8TZh for <iommu@lists.linux-foundation.org>;
 Mon, 19 Oct 2020 21:16:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 1966787126
 for <iommu@lists.linux-foundation.org>; Mon, 19 Oct 2020 21:16:15 +0000 (UTC)
IronPort-SDR: NN/Ej8Ep+rcinDrhrUBUUR2ppIfA536IGYZrewB98uh0XFERhDXSqLAX9v9JukU5MHlWQYE9x9
 sViROc/Gh6VQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9779"; a="166333400"
X-IronPort-AV: E=Sophos;i="5.77,395,1596524400"; d="scan'208";a="166333400"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2020 14:16:09 -0700
IronPort-SDR: CD359c4xk3Rf5x/5MIJhCR+FanRrzqfrS0rmjpc53eh6Mc5CuJOA3jRoJQHw7dASZ8S8ab517E
 oIggluFAQglg==
X-IronPort-AV: E=Sophos;i="5.77,395,1596524400"; d="scan'208";a="347587269"
Received: from otc-nc-03.jf.intel.com (HELO otc-nc-03) ([10.54.39.36])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2020 14:16:09 -0700
Date: Mon, 19 Oct 2020 14:16:08 -0700
From: "Raj, Ashok" <ashok.raj@intel.com>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: Re: [RFC PATCH 0/2] iommu: Avoid unnecessary PRI queue flushes
Message-ID: <20201019211608.GA79633@otc-nc-03>
References: <20201015090028.1278108-1-jean-philippe@linaro.org>
 <20201015182211.GA54780@otc-nc-03>
 <20201016075923.GB1309464@myrica>
 <20201017112525.GA47206@otc-nc-03>
 <20201019140824.GA1478235@myrica>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201019140824.GA1478235@myrica>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: kevin.tian@intel.com, "Lu, Baolu" <baolu.lu@intel.com>, arnd@arndb.de,
 gregkh@linuxfoundation.org, iommu@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org, Jacon Jun Pan <jacob.jun.pan@intel.com>,
 linux-pci@vger.kernel.org, zhangfei.gao@linaro.org,
 Ashok Raj <ashok.raj@intel.com>, dwmw2@infradead.org,
 linux-accelerators@lists.ozlabs.org
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

Hi Jean

On Mon, Oct 19, 2020 at 04:08:24PM +0200, Jean-Philippe Brucker wrote:
> On Sat, Oct 17, 2020 at 04:25:25AM -0700, Raj, Ashok wrote:
> > > For devices that *don't* use a stop marker, the PCIe spec says (10.4.1.2):
> > > 
> > >   To stop [using a PASID] without using a Stop Marker Message, the
> > >   function shall:
> > >   1. Stop queueing new Page Request Messages for this PASID.
> > 
> > The device driver would need to tell stop sending any new PR's.
> > 
> > >   2. Finish transmitting any multi-page Page Request Messages for this
> > >      PASID (i.e. send the Page Request Message with the L bit Set).
> > >   3. Wait for PRG Response Messages associated any outstanding Page
> > >      Request Messages for the PASID.
> > > 
> > > So they have to flush their PR themselves. And since the device driver
> > > completes this sequence before calling unbind(), then there shouldn't be
> > > any oustanding PR for the PASID, and unbind() doesn't need to flush,
> > > right?
> > 
> > I can see how the device can complete #2,3 above. But the device driver
> > isn't the one managing page-responses right. So in order for the device to
> > know the above sequence is complete, it would need to get some assist from
> > IOMMU driver?
> 
> No the device driver just waits for the device to indicate that it has
> completed the sequence. That's what the magic stop-PASID mechanism
> described by PCIe does. In 6.20.1 "Managing PASID TLP Prefix Usage" it
> says:

The goal is we do this when the device is in a messup up state. So we can't
take for granted the device is properly operating which is why we are going
to wack the device with a flr().

The only thing that's supposed to work without a brain freeze is the
invalidation logic. Spec requires devices to respond to invalidations even when
they are in the process of flr().

So when IOMMU does an invalidation wait with a Page-Drain, IOMMU waits till
the response for that arrives before completing the descriptor. Due to 
the posted semantics it will ensure any PR's issued and in the fabric are flushed 
out to memory. 

I suppose you can wait for the device to vouch for all responses, but that
is assuming the device is still functioning properly. Given that we use it
in two places,

* Reclaiming a PASID - only during a tear down sequence, skipping it
  doesn't really buy us much.
* During FLR this can't be skipped anyway due to the above sequence
  requirement. 

> 
> "A Function must have a mechanism to request that it gracefully stop using
>  a specific PASID. This mechanism is device specific but must satisfy the
>  following rules:
>  [...]
>  * When the stop request mechanism indicates completion, the Function has:
>    [...]
>    * Complied with additional rules described in Address Translation
>      Services (Chapter 10 [10.4.1.2 quoted above]) if Address Translations
>      or Page Requests were issued on the behalf of this PASID."
> 
> So after the device driver initiates this mechanism in the device, the
> device must be able to indicate completion of the mechanism, which
> includes completing all in-flight Page Requests. At that point the device
> driver can call unbind() knowing there is no pending PR for this PASID.
> 

Cheers,
Ashok
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
