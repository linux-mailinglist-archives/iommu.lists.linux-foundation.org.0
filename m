Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 06EF720ED20
	for <lists.iommu@lfdr.de>; Tue, 30 Jun 2020 07:07:23 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 782E7878BB;
	Tue, 30 Jun 2020 05:07:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LmevK9KARehq; Tue, 30 Jun 2020 05:07:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 30B5087BE5;
	Tue, 30 Jun 2020 05:07:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0F48DC016E;
	Tue, 30 Jun 2020 05:07:20 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1083EC016E
 for <iommu@lists.linux-foundation.org>; Tue, 30 Jun 2020 05:07:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id EA25887BE5
 for <iommu@lists.linux-foundation.org>; Tue, 30 Jun 2020 05:07:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fK3SygQP0jy5 for <iommu@lists.linux-foundation.org>;
 Tue, 30 Jun 2020 05:07:17 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 8BCDF878BB
 for <iommu@lists.linux-foundation.org>; Tue, 30 Jun 2020 05:07:17 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 04C636736F; Tue, 30 Jun 2020 07:07:13 +0200 (CEST)
Date: Tue, 30 Jun 2020 07:07:12 +0200
From: Christoph Hellwig <hch@lst.de>
To: Daniel Borkmann <daniel@iogearbox.net>
Subject: Re: [PATCH net] xsk: remove cheap_dma optimization
Message-ID: <20200630050712.GA26840@lst.de>
References: <20200626134358.90122-1-bjorn.topel@gmail.com>
 <c60dfb5a-2bf3-20bd-74b3-6b5e215f73f8@iogearbox.net>
 <20200627070406.GB11854@lst.de>
 <88d27e1b-dbda-301c-64ba-2391092e3236@intel.com>
 <e879bcc8-5f7d-b1b3-9b66-1032dec6245d@iogearbox.net>
 <81aec200-c1a0-6d57-e3b6-26dad30790b8@intel.com>
 <903c646c-dc74-a15c-eb33-e1b67bc7da0d@iogearbox.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <903c646c-dc74-a15c-eb33-e1b67bc7da0d@iogearbox.net>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: maximmi@mellanox.com, konrad.wilk@oracle.com, jonathan.lemon@gmail.com,
 linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
 iommu@lists.linux-foundation.org, netdev@vger.kernel.org, bpf@vger.kernel.org,
 =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn.topel@intel.com>, davem@davemloft.net,
 magnus.karlsson@intel.com
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On Mon, Jun 29, 2020 at 05:18:38PM +0200, Daniel Borkmann wrote:
> On 6/29/20 5:10 PM, Bj=F6rn T=F6pel wrote:
>> On 2020-06-29 15:52, Daniel Borkmann wrote:
>>>
>>> Ok, fair enough, please work with DMA folks to get this properly integr=
ated and
>>> restored then. Applied, thanks!
>>
>> Daniel, you were too quick! Please revert this one; Christoph just submi=
tted a 4-patch-series that addresses both the DMA API, and the perf regress=
ion!
>
> Nice, tossed from bpf tree then! (Looks like it didn't land on the bpf li=
st yet,
> but seems other mails are currently stuck as well on vger. I presume it w=
ill be
> routed to Linus via Christoph?)

I send the patches to the bpf list, did you get them now that vger
is unclogged?  Thinking about it the best route might be through
bpf/net, so if that works for you please pick it up.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
