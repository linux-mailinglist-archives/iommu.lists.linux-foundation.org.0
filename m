Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 65929B4BAA
	for <lists.iommu@lfdr.de>; Tue, 17 Sep 2019 12:13:17 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 4ED2B1164;
	Tue, 17 Sep 2019 10:13:15 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id F2371F94
	for <iommu@lists.linux-foundation.org>;
	Tue, 17 Sep 2019 10:13:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
	[85.220.165.71])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 0374E8C4
	for <iommu@lists.linux-foundation.org>;
	Tue, 17 Sep 2019 10:13:10 +0000 (UTC)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
	by metis.ext.pengutronix.de with esmtps
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1iAATo-0001d0-WF; Tue, 17 Sep 2019 12:13:05 +0200
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
	(envelope-from <ukl@pengutronix.de>)
	id 1iAATn-00039w-53; Tue, 17 Sep 2019 12:13:03 +0200
Date: Tue, 17 Sep 2019 12:13:03 +0200
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v1 2/2] of: Let of_for_each_phandle fallback to
	non-negative cell_count
Message-ID: <20190917101303.t5otztdus7y3ayau@pengutronix.de>
References: <20190824132846.8589-1-u.kleine-koenig@pengutronix.de>
	<20190824132846.8589-2-u.kleine-koenig@pengutronix.de>
	<20190913215809.GA11833@bogus>
	<CAMuHMdV+pwoAA0zH_vQf2nKqzrgHP8rcMStyJbnuu2qviFC_qg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMuHMdV+pwoAA0zH_vQf2nKqzrgHP8rcMStyJbnuu2qviFC_qg@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
	SAEximRunCond expanded to false
X-PTX-Original-Recipient: iommu@lists.linux-foundation.org
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Rob Herring <robh@kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
	<devicetree@vger.kernel.org>, Frank Rowand <frowand.list@gmail.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Linux IOMMU <iommu@lists.linux-foundation.org>,
	linux-mediatek@lists.infradead.org, Linux I2C <linux-i2c@vger.kernel.org>,
	Sascha Hauer <kernel@pengutronix.de>,
	Matthias Brugger <matthias.bgg@gmail.com>, Will Deacon <will@kernel.org>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	Robin Murphy <robin.murphy@arm.com>
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

Hello Geert,

On Tue, Sep 17, 2019 at 11:40:25AM +0200, Geert Uytterhoeven wrote:
> Hi Rob, Uwe,
> =

> On Fri, Sep 13, 2019 at 11:58 PM Rob Herring <robh@kernel.org> wrote:
> > On Sat, 24 Aug 2019 15:28:46 +0200, =3D?UTF-8?q?Uwe=3D20Kleine-K=3DC3=
=3DB6nig?=3D          wrote:
> > > Referencing device tree nodes from a property allows to pass argument=
s.
> > > This is for example used for referencing gpios. This looks as follows:
> > >
> > >       gpio_ctrl: gpio-controller {
> > >               #gpio-cells =3D <2>
> > >               ...
> > >       }
> > >
> > >       someothernode {
> > >               gpios =3D <&gpio_ctrl 5 0 &gpio_ctrl 3 0>;
> > >               ...
> > >       }
> > >
> > > To know the number of arguments this must be either fixed, or the
> > > referenced node is checked for a $cells_name (here: "#gpio-cells")
> > > property and with this information the start of the second reference =
can
> > > be determined.
> > >
> > > Currently regulators are referenced with no additional arguments. To
> > > allow some optional arguments without having to change all referenced
> > > nodes this change introduces a way to specify a default cell_count. So
> > > when a phandle is parsed we check for the $cells_name property and use
> > > it as before if present. If it is not present we fall back to
> > > cells_count if non-negative and only fail if cells_count is smaller t=
han
> > > zero.
> > >
> > > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> =

> This is now commit e42ee61017f58cd9 ("of: Let of_for_each_phandle fallback
> to non-negative cell_count") in robh/for-next, which causes a lock-up when
> booting a shmobile_defconfig kernel on r8a7791/koelsch:
> =

> rcu: INFO: rcu_sched self-detected stall on CPU
> rcu:     0-....: (2099 ticks this GP) idle=3D6fe/1/0x40000002
> softirq=3D29/29 fqs=3D1050
>  (t=3D2100 jiffies g=3D-1131 q=3D0)
> NMI backtrace for cpu 0
> CPU: 0 PID: 1 Comm: swapper/0 Not tainted
> 5.3.0-rc2-shmobile-00050-ge42ee61017f58cd9 #376
> Hardware name: Generic R-Car Gen2 (Flattened Device Tree)
> [<c010f8ac>] (unwind_backtrace) from [<c010b620>] (show_stack+0x10/0x14)
> [<c010b620>] (show_stack) from [<c073d038>] (dump_stack+0x7c/0x9c)
> [<c073d038>] (dump_stack) from [<c0742e80>] (nmi_cpu_backtrace+0xa0/0xb8)
> [<c0742e80>] (nmi_cpu_backtrace) from [<c0742f1c>] (nmi_trigger_cpumask_b=
acktrace+0x84/0x114)
> [<c0742f1c>] (nmi_trigger_cpumask_backtrace) from [<c017d684>] (rcu_dump_=
cpu_stacks+0xac/0xc8)
> [<c017d684>] (rcu_dump_cpu_stacks) from [<c017a598>] (rcu_sched_clock_irq=
+0x2ac/0x6b4)
> [<c017a598>] (rcu_sched_clock_irq) from [<c0183980>] (update_process_time=
s+0x30/0x5c)
> [<c0183980>] (update_process_times) from [<c01941a8>] (tick_nohz_handler+=
0xcc/0x120)
> [<c01941a8>] (tick_nohz_handler) from [<c05b1d40>] (arch_timer_handler_vi=
rt+0x28/0x30)
> [<c05b1d40>] (arch_timer_handler_virt) from [<c016c9e0>] (handle_percpu_d=
evid_irq+0xe8/0x21c)
> [<c016c9e0>] (handle_percpu_devid_irq) from [<c0167a8c>] (generic_handle_=
irq+0x18/0x28)
> [<c0167a8c>] (generic_handle_irq) from [<c0167b3c>] (__handle_domain_irq+=
0xa0/0xb4)
> [<c0167b3c>] (__handle_domain_irq) from [<c03673ec>] (gic_handle_irq+0x58=
/0x90)
> [<c03673ec>] (gic_handle_irq) from [<c0101a8c>] (__irq_svc+0x6c/0x90)
> Exception stack(0xeb08dd30 to 0xeb08dd78)
> dd20:                                     c0cc7514 20000013 00000005 0000=
3b27
> dd40: eb7c4020 c0cc750c 00000051 00000051 20000013 c0c66b08 eb1cdc00 0000=
0018
> dd60: 00000000 eb08dd80 c05c1a38 c0756c00 20000013 ffffffff
> [<c0101a8c>] (__irq_svc) from [<c0756c00>] (_raw_spin_unlock_irqrestore+0=
x1c/0x20)
> [<c0756c00>] (_raw_spin_unlock_irqrestore) from [<c05c1a38>] (of_find_nod=
e_by_phandle+0xcc/0xf0)
> [<c05c1a38>] (of_find_node_by_phandle) from [<c05c1bb8>] (of_phandle_iter=
ator_next+0x68/0x178)
> [<c05c1bb8>] (of_phandle_iterator_next) from [<c05c22bc>] (of_count_phand=
le_with_args+0x5c/0x7c)
> [<c05c22bc>] (of_count_phandle_with_args) from [<c053fc38>] (i2c_demux_pi=
nctrl_probe+0x24/0x1fc)
> [<c053fc38>] (i2c_demux_pinctrl_probe) from [<c04463c4>] (platform_drv_pr=
obe+0x48/0x94)
> [<c04463c4>] (platform_drv_probe) from [<c0444a20>] (really_probe+0x1f0/0=
x2b8)
> [<c0444a20>] (really_probe) from [<c0444e68>] (driver_probe_device+0x140/=
0x158)
> [<c0444e68>] (driver_probe_device) from [<c0444ff0>] (device_driver_attac=
h+0x44/0x5c)
> [<c0444ff0>] (device_driver_attach) from [<c04450b4>] (__driver_attach+0x=
ac/0xb4)
> [<c04450b4>] (__driver_attach) from [<c0443178>] (bus_for_each_dev+0x64/0=
xa0)
> [<c0443178>] (bus_for_each_dev) from [<c04438a8>] (bus_add_driver+0x148/0=
x1a8)
> [<c04438a8>] (bus_add_driver) from [<c0445ad0>] (driver_register+0xac/0xf=
0)
> [<c0445ad0>] (driver_register) from [<c0b010b0>] (do_one_initcall+0xa8/0x=
1d4)
> [<c0b010b0>] (do_one_initcall) from [<c0b01448>] (kernel_init_freeable+0x=
26c/0x2c8)
> [<c0b01448>] (kernel_init_freeable) from [<c0751c70>] (kernel_init+0x8/0x=
10c)
> [<c0751c70>] (kernel_init) from [<c01010e8>] (ret_from_fork+0x14/0x2c)
> Exception stack(0xeb08dfb0 to 0xeb08dff8)
> dfa0:                                     00000000 00000000 00000000 0000=
0000
> dfc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 0000=
0000
> dfe0: 00000000 00000000 00000000 00000000 00000013 00000000
> =

> Presumably it loops forever, due to a conversion of -1 to unsigned
> somewhere?

Hmm, I fail to see the culprit. i2c_demux_pinctrl_probe calls
of_count_phandle_with_args with cells_name=3DNULL. With that I don't see
how my patch changes anything as the only change is in an if
(it->cells_name) block that shouldn't be relevant in your case.

Can you please verify that the loop in of_count_phandle_with_args is
indeed not terminating, e.g. with

diff --git a/drivers/of/base.c b/drivers/of/base.c
index 2f25d2dfecfa..2425a6d26038 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -1769,8 +1769,13 @@ int of_count_phandle_with_args(const struct device_n=
ode *np, const char *list_na
 	if (rc)
 		return rc;
 =

-	while ((rc =3D of_phandle_iterator_next(&it)) =3D=3D 0)
+	pr_err("%s: enter loop (np=3D%pOF, list_name=3D%s, cells_name=3D%s)\n",
+	       __func__, np, list_name, cells_name);
+	while ((rc =3D of_phandle_iterator_next(&it)) =3D=3D 0) {
+		pr_err("%s: it.node =3D %pOF cur_index=3D%d\n", __func__, it.node, cur_i=
ndex);
 		cur_index +=3D 1;
+	}
+	pr_err("%s: exit loop\n", __func__);
 =

 	if (rc !=3D -ENOENT)
 		return rc;

Thanks
Uwe
-- =

Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
