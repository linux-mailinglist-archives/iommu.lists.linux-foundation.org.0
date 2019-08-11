Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 3667E890B3
	for <lists.iommu@lfdr.de>; Sun, 11 Aug 2019 10:42:53 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 9F302AE7;
	Sun, 11 Aug 2019 08:42:48 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id D5798ACC
	for <iommu@lists.linux-foundation.org>;
	Sun, 11 Aug 2019 08:42:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 4BA36786
	for <iommu@lists.linux-foundation.org>;
	Sun, 11 Aug 2019 08:42:47 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id d17so21066866qtj.8
	for <iommu@lists.linux-foundation.org>;
	Sun, 11 Aug 2019 01:42:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=OwTyRG3c0uWeDZrJY6ZpPNgUs/dENdNyzYLQJF235ng=;
	b=YcdXVF15dGkjSO1tI5ISMyqDVgXuq6Hk5QlPTcQQokpHwimZGW+BV0Dp8laGmnNVxp
	AWlpMIdztOtjamW4wx0glQwKmgOd/ES3reVAZnf3+xl5n6whY23LvBkKjtVcbFlKWk1T
	ArakcQGdGfgL46fxbqq1ZD1kfvJ+DPxWAKLc6kRE3lBEc+Z3gQX3UTqeDKnflDcsetib
	H6ClH3WS1fPK6jzdjRyTcfm8kBSLjUmtm4Rdir5bEOVg9ImXNbPE2k9sO6fQofxNP7Sl
	KzYi5eLwqTYi9KZFAxpxNv7NHu1bZg6gADkMig4IKw3U9O1RqkFLpPUMsvrWV37z6xdW
	l3QA==
X-Gm-Message-State: APjAAAVxkvNzVzoMQ+ybAOu2TIbEwD4bXIDeDqZwkoHaweNK39n09OU3
	BKtXq5WHPmoOJCtPb4ofVBHcOg==
X-Google-Smtp-Source: APXvYqzuHJ2U68lDoEL7EBgwf3NbWFXfC318bVrfWPFs3lvkcljrjOCTNgmV+LGovkQ0nKOOObqhmg==
X-Received: by 2002:a0c:ae6d:: with SMTP id z42mr25654119qvc.8.1565512966475; 
	Sun, 11 Aug 2019 01:42:46 -0700 (PDT)
Received: from redhat.com (bzq-79-181-91-42.red.bezeqint.net. [79.181.91.42])
	by smtp.gmail.com with ESMTPSA id
	m5sm42472030qkb.117.2019.08.11.01.42.41
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sun, 11 Aug 2019 01:42:45 -0700 (PDT)
Date: Sun, 11 Aug 2019 04:42:38 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [RFC PATCH] virtio_ring: Use DMA API if guest memory is encrypted
Message-ID: <20190811041636-mutt-send-email-mst@kernel.org>
References: <87zhrj8kcp.fsf@morokweng.localdomain>
	<20190810143038-mutt-send-email-mst@kernel.org>
	<20190810220702.GA5964@ram.ibm.com> <20190811055607.GA12488@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190811055607.GA12488@lst.de>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Jason Wang <jasowang@redhat.com>, Alexey Kardashevskiy <aik@linux.ibm.com>,
	Ram Pai <linuxram@us.ibm.com>, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	Paul Mackerras <paulus@ozlabs.org>, iommu@lists.linux-foundation.org,
	linuxppc-devel@lists.ozlabs.org, David Gibson <david@gibson.dropbear.id.au>
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

On Sun, Aug 11, 2019 at 07:56:07AM +0200, Christoph Hellwig wrote:
> And once again this is entirely going in the wrong direction.  The only
> way using the DMA API is going to work at all is if the device is ready
> for it.

So the point made is that if DMA addresses are also physical addresses
(not necessarily the same physical addresses that driver supplied), then
DMA API actually works even though device itself uses CPU page tables.


To put it in other terms: it would be possible to make all or part of
memory unenecrypted and then have virtio access all of it.  SEV guests
at the moment make a decision to instead use a bounce buffer, forcing an
extra copy but gaining security.

-- 
MST
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
